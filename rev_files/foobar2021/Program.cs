using System;

namespace win
{
    class Program
    {
        static int sum_all(string password)
        {
            int sum = 0;
            foreach(char c in password)
            {
                sum += (int)c;
            }
            return sum;
        }

        static int check(int[] values)
        {
            int[] val = { 2410, 2404, 2430, 2408, 2391, 2381, 2333, 2396, 2369, 2332, 2398, 2422, 2332, 2397, 2416, 2370, 2393, 2304, 2393, 2333, 2416, 2376, 2371, 2305, 2377, 2391 };
            int f = 0;
            for (int i= 0;i < val.Length;i++)
            {
                if(val[i] == values[i])
                {
                    f = 1;
                }
                else
                {
                    f = 0;
                    break;
                }
            }
                return f;
        }
        static void Main(string[] args)
        {
            Console.WriteLine("Hello there mate \nJust enter the flag to check : ");
            string password = Console.ReadLine();
            int[] arr = new int[26];
            if (password.Length != 26)
            {
                Console.WriteLine("Input length error");
                Console.ReadLine();
            }
            else
            {
                for (int i = 0; i < password.Length; i++)
                {
                    arr[i] = (int)password[i];
                }
                int[] enc_arr = new int[26];
                for(int i =0;i < 26;i++)
                {
                    enc_arr[i] = (arr[i] - ((i % 2) * 2 + (i % 3) * 1) ^ sum_all(password));
                }
                int f = check(enc_arr);
                if (f == 1)
                {
                    Console.WriteLine("Your flag : " + password);
                    Console.ReadLine();
                }
                else
                {
                    Console.WriteLine("try harder");
                    Console.ReadLine();
                }
            }
        }
    }
}
