using UnityEngine;
using UnityEngine.UI;
using System.Collections.Generic;

public class ControlDropdownWindows : MonoBehaviour
{
    public Dropdown dropdown; // Asigna el Dropdown desde el Inspector.
    public List<GameObject> ventanaPrefabs; // Asigna los prefabs de las ventanas desde el Inspector.
    public Transform canvasTransform; // Asigna el Transform del Canvas desde el Inspector.

    private GameObject ventanaActual; // Almacena la ventana actual.


    public GameObject Muro; // Almacena el Muro actual.
   
    [SerializeField] private Slider Alto;
    [SerializeField] private Slider Profundo;
    [SerializeField] private Slider Ancho;



    private void Start()
    {

        Profundo.value = Muro.transform.localScale.x;
        Ancho.value = Muro.transform.localScale.y;
        Alto.value = Muro.transform.localScale.z;





        // Limpia las opciones del Dropdown, para que la ventana no se sobreponga.
        dropdown.ClearOptions();

        // Asigna las opciones del Dropdown con los nombres de las ventanas.
        List<Dropdown.OptionData> options = new List<Dropdown.OptionData>();
        foreach (GameObject ventanaPrefab in ventanaPrefabs)
        {
            options.Add(new Dropdown.OptionData(ventanaPrefab.name));
        }
        dropdown.AddOptions(options);

        // Maneja el evento de cambio en el Dropdown.
        dropdown.onValueChanged.AddListener(OnDropdownValueChanged);
    }


    void Update()
    {
        // Actualiza la posición, rotación y escala del objeto según los valores de los sliders
        Muro.transform.localScale = new Vector3(Ancho.value, Alto.value, Profundo.value);
    }

 

private void OnDropdownValueChanged(int value)
    {
        // Asegúrate de que haya ventanas para instanciar y el valor sea válido.
        if (ventanaPrefabs.Count == 0 || value < 0 || value >= ventanaPrefabs.Count)
        {
            return;
        }

        // Verificar si hay una ventana actual y destruirla.
        if (ventanaActual != null)
        {
            Destroy(ventanaActual);
        }

        // Instanciar la nueva ventana en la posición y rotación configuradas.
        Vector3 posicionVentana = new Vector3(2.56f, 0.91f, -0.2f);
        Quaternion rotacionVentana = Quaternion.identity;

        ventanaActual = Instantiate(ventanaPrefabs[value], posicionVentana, rotacionVentana);
        ventanaActual.transform.SetParent(canvasTransform, false);
    }
}
