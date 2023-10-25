using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class SceneManager : MonoBehaviour
{


    [Header ("Login")]
    [SerializeField] private InputField m_loginPasswordInput = null;
    [SerializeField] private InputField m_loginUserNameInput = null;

    [Header ("Register")]
    [SerializeField] private GameObject m_registerUI = null;
    [SerializeField] private GameObject m_loginUI = null;

    [SerializeField] private Text m_errorText = null;

    [SerializeField] private InputField m_userNameInput = null;
    [SerializeField] private InputField m_emailInput = null;
    [SerializeField] private InputField m_password = null;
    [SerializeField] private InputField m_reEnterPassword = null;

    private NetworkManager m_networkManager = null;

    private void Awake()
    {
        m_networkManager = GameObject.FindObjectOfType<NetworkManager>();
    }


    public void SubmitLogin()
    {
        if(m_loginUserNameInput.text == "" || m_loginPasswordInput.text == "")
        {
            m_errorText.text = "Porfavor llene todos los campos";
            return;
        }

        m_errorText.text = "procesando...";

        m_networkManager.CheckUser(m_loginUserNameInput.text,  m_loginPasswordInput.text, delegate(Response response)
            { 
                m_errorText.text = response.message;
            });
    }


    public void SubmitRegister()
    {
        if(m_userNameInput.text == "" || m_emailInput.text == "" || m_password.text == "" || m_reEnterPassword.text == "")
        {
            m_errorText.text = "Porfavor llene todos los campos";
            return;
        }

        if (m_password.text == m_reEnterPassword.text)
        {
            m_errorText.text = "procesando...";

            m_networkManager.CreateUser(m_userNameInput.text, m_emailInput.text, m_password.text, delegate(Response response)
            { 
                m_errorText.text = response.message;
            });
        }
        else
        {
            m_errorText.text = "Contraseñas no son iguales por favor verifique";
        }
       
    }

    public void showlogin() 
    {
        m_registerUI.SetActive(false);
        m_loginUI.SetActive(true);
    }

    public void showRegister()
    {
        m_registerUI.SetActive(true);
        m_loginUI.SetActive(false);
    }

 
}
