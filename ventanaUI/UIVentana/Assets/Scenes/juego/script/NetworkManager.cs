using System;
using System.Collections;
using UnityEngine;

public class NetworkManager : MonoBehaviour
{

   public void CreateUser(string userName, string email, string pass,Action<Response> response)
    {
        StartCoroutine( CO_CreateUser(userName, email, pass, response) );

    }
    private IEnumerator CO_CreateUser(string userName, string email, string pass, Action<Response> response)
    {
        WWWForm form = new WWWForm(); 
        form.AddField("userName", userName);
        form.AddField("email", email);
        form.AddField("pass", pass);

        WWW w = new WWW("http://localhost/Game/createUser.php", form);

        yield return w;
        Debug.Log(w.text);
        response(JsonUtility.FromJson<Response>(w.text));
    }

    public void CheckUser(string userName, string pass,Action<Response> response)
    {
        StartCoroutine( CO_CheckUser(userName, pass, response) );

    }
    private IEnumerator CO_CheckUser(string userName, string pass, Action<Response> response)
    {
        WWWForm form = new WWWForm(); 
        form.AddField("userName", userName);
        form.AddField("pass", pass);

        WWW w = new WWW("http://localhost/Game/checkUser.php", form);

        yield return w;
        Debug.Log(w.text);
        response(JsonUtility.FromJson<Response>(w.text));
    }

}

[Serializable]
public class Response
{
    public bool done        = false;
    public string message   = "";
}