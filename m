From: shuah@kernel.org (shuah)
Date: Fri, 19 Apr 2019 15:03:06 -0600
Subject: [PATCH for 5.1 3/3] rseq/selftests: Adapt number of threads to
 the number of detected cpus
In-Reply-To: <1136505826.203.1555707541777.JavaMail.zimbra@efficios.com>
References: <20190305194755.2602-1-mathieu.desnoyers@efficios.com>
 <1444419838.71.1555677682502.JavaMail.zimbra@efficios.com>
 <1266612341.87.1555678507226.JavaMail.zimbra@efficios.com>
 <614774674.134.1555681346941.JavaMail.zimbra@efficios.com>
 <1863599735.141.1555681723685.JavaMail.zimbra@efficios.com>
 <6ba0796c-8a96-f797-265c-37bfb9b4bb71@kernel.org>
 <580328197.148.1555684824260.JavaMail.zimbra@efficios.com>
 <cfcbace7-363d-e45e-11da-8efb200783b7@kernel.org>
 <1136505826.203.1555707541777.JavaMail.zimbra@efficios.com>
Message-ID: <45ecf26a-a2f4-fa86-a252-e1d9b3bc4224@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190419210306.FkhQNFrI3FBA9VIQBGYNlHkaMepniK3pQqeb_prn2Sw@z>

On 4/19/19 2:59 PM, Mathieu Desnoyers wrote:
> ----- On Apr 19, 2019,@2:57 PM, shuah shuah@kernel.org wrote:
> [...]
>> Should I drop this patch that is currently in linux-kseltest next? Just
>> confirming if your new patch is supposed to be applied on top of this
>> one or not?
> 
> We should keep this patch in linux-kselftest next. The fix applies on top
> of it.
> 

Will do. Thanks for a quick response.

-- Shuah
