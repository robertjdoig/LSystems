using UnityEngine;
using System.Collections;

public class LSystem : MonoBehaviour {
    
    public GameObject stemPrefab;
    GameObject stemPrefabClone;

	// Use this for initialization
	void Start () {
         stem(new Vector3(0, 0, 0), Quaternion.Euler(0,0,0), new Vector3(1, 10, 1));
    }
	
	// Update is called once per frame
	void Update () {
        
	}

    void stem(Vector3 pos, Quaternion rotation, Vector3 size)
    {

        stemPrefabClone = Instantiate(stemPrefab,new Vector3(0,0,0), rotation) as GameObject;

        stemPrefabClone.transform.localPosition = pos;
        //stemPrefabClone.transform.localEulerAngles = rotation;
        stemPrefabClone.transform.localScale = size;

        //Next Stem Varibales
        Vector3 tempPos = pos + new Vector3(0,size.y*2,0);
        Quaternion tempRot = Quaternion.Euler(Random.Range(0, 180),0, Random.Range(0, 180));
        //Quaternion tempRot = Quaternion.Euler(0, 0, 0);
        size *= Random.Range(0.4f, 0.8f);

        if (size.y > 2)
        {
            stem(tempPos, tempRot, size);

        }

    }
}
