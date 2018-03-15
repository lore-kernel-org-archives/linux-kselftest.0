From: ravi.bangoria at linux.vnet.ibm.com (Ravi Bangoria)
Date: Thu, 15 Mar 2018 13:31:29 +0530
Subject: [PATCH v5 16/19] tracing: probeevent: Add array type support
In-Reply-To: <20180315162303.1250dea1500aea420ecd85c6@kernel.org>
References: <152049860385.7289.14079393589900496424.stgit@devbox>
 <152049905133.7289.17516121776689315422.stgit@devbox>
 <72be81a4-710a-b942-277d-9156c3debc5d@linux.vnet.ibm.com>
 <20180315161840.71d524a73307881febfe34c2@kernel.org>
 <20180315162303.1250dea1500aea420ecd85c6@kernel.org>
Message-ID: <d94e56c0-4096-5b8d-9e84-6a83b3daa84f@linux.vnet.ibm.com>



On 03/15/2018 12:53 PM, Masami Hiramatsu wrote:
>
> Sorry, that is too complicated than enough. you should try to specify a[0] instead of a.
>
>  $ sudo ./perf probe -x ~/hello foo1 'a=a[0]:x32[3]'

Cool.. that works fine.

$ sudo ./perf script
           hello  1779 [034]    76.081971: probe_hello:foo1: (100005fc) a={0x4,0x5,0x6}

Thanks,
Ravi

> :)
>
> Thank you,
>

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
