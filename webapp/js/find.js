
    function find()
    {
        alert("请联系XXX");
    }

    function clear()
    {
        sessionStorage.clear();

    }

    function select (id,inp)
    {
        document.getElementById(inp).value= document.getElementById(id).innerHTML;

    }




    function clarify()
    {

        var i = document.getElementById("certify").value;


        var o= document.getElementById("pswd").value;

        if(i==o)
        {

            document.getElementById("w").innerHTML="";
            return true;
        }
        else
        {

            document.getElementById("w").innerHTML="请与输入密码相同";
            return false;
        }


    }

    function isEmpty(str) {
        return null == str || str.length === 0;
    }

    function s  (i)
    {
        var idos=i.split(" ");



        for(k=0;k<idos.length;k++)
        {
            if(isEmpty( document.getElementById(idos[k]).value))
            {
                j=k++;
                alert("第"+j+"处为空");
                return false;
            }
        }

        return true;
    }

    function copy(i)
    {

        var ori= document.getElementById(i);

        var j=i+"c";
        var cop=document.getElementById(j);

        cop.value=ori.value;
    }

    function del(me,formid)
    {
            var d = confirm(me);
            var form= document.getElementById(formid)
            if(d)
            {
                form.submit();
            }
    }


