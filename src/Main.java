import java.io.DataInputStream;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;


//接收端
//记录数据0.2s
public class Main {


    static ServerSocket server_Socket;
    static Socket socekt;


    public static float byte2float(byte[] b, int index) {
        int l;
        l = b[index + 0];
        l &= 0xff;
        l |= ((long) b[index + 1] << 8);
        l &= 0xffff;
        l |= ((long) b[index + 2] << 16);
        l &= 0xffffff;
        l |= ((long) b[index + 3] << 24);
        return Float.intBitsToFloat(l);
    }

    public static int bytesToInt(byte[] src, int offset) {
        int value;
        value = (int) ( ((src[offset+3] & 0xFF)<<24)
                |((src[offset+2] & 0xFF)<<16)
                |((src[offset+1] & 0xFF)<<8)
                |(src[offset+0] & 0xFF));
        return value;
    }


    public static  void main(String argus[])
    {
        File datafile = new File("y30.txt");
        try {
            server_Socket = new ServerSocket(12345);
//        while(true) {
            socekt = server_Socket.accept();
             //获取二进制流
            DataInputStream input=new DataInputStream(socekt.getInputStream());

           //文件设置
            FileWriter out = new FileWriter(datafile);
            String line = System.getProperty("line.separator");


            byte[] buffer = new byte[20480];
            //消息长度
            int rlength=input.read(buffer, 0, 20480);
            while(rlength != -1) {
//                System.out.println("接收的消息长度:" + rlength);
                int f = bytesToInt(buffer, 0);
                System.out.println("接收的消息:" + f);
                rlength=input.read(buffer, 0, 20480);
                out.write("" + f);;
                out.write(line);
            }
            out.close();

//        }
    } catch (IOException e) {
        e.printStackTrace();
    }

    }
}
