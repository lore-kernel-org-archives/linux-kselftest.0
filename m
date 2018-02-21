From: shuah at kernel.org (Shuah Khan)
Date: Wed, 21 Feb 2018 16:03:00 -0700
Subject: [PATCH] selftests/bpf: update gitignore with test_libbpf_open
In-Reply-To: <20180221.174830.160781272671654190.davem@davemloft.net>
References: <20180221213001.18682-1-anders.roxell@linaro.org>
 <20180221.174830.160781272671654190.davem@davemloft.net>
Message-ID: <89896e14-e4ad-bb3d-2d9f-44cfa084a8cd@kernel.org>

On 02/21/2018 03:48 PM, David Miller wrote:
> From: Anders Roxell <anders.roxell at linaro.org>
> Date: Wed, 21 Feb 2018 22:30:01 +0100
> 
>> bpf builds a test program for loading BPF ELF files. Add the executable
>> to the .gitignore list.
>>
>> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
> 
> Acked-by: David S. Miller <davem at davemloft.net>
> 
> 

Thanks. I will pull this in for 4.16-rc

-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
