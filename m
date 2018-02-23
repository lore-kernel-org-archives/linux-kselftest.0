From: linuxram@us.ibm.com (Ram Pai)
Date: Fri, 23 Feb 2018 10:51:47 -0800
Subject: [PATCH 2/2] selftests/powerpc: Add core file test for Protection
 Key registers
In-Reply-To: <20180223183344.21038-2-bauerman@linux.vnet.ibm.com>
References: <20180223183344.21038-1-bauerman@linux.vnet.ibm.com>
 <20180223183344.21038-2-bauerman@linux.vnet.ibm.com>
Message-ID: <20180223185147.GJ5559@ram.oc3035372033.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180223185147.lZ32Y8RAefcqOUKx7c9bY9BvnLU_DOWWz7wvqkKG9W8@z>

On Fri, Feb 23, 2018@03:33:44PM -0300, Thiago Jung Bauermann wrote:
> This test verifies that the AMR, IAMR and UAMOR are being written to a
> process' core file.
> 

Acked-by: Ram Pai <linuxram at us.ibm.com>
Tested-by: Ram Pai <linuxram at us.ibm.com>

> Signed-off-by: Thiago Jung Bauermann <bauerman at linux.vnet.ibm.com>
> ---
>  tools/testing/selftests/powerpc/ptrace/Makefile    |   5 +-
>  tools/testing/selftests/powerpc/ptrace/core-pkey.c | 460 +++++++++++++++++++++
>  2 files changed, 464 insertions(+), 1 deletion(-)
>  create mode 100644 tools/testing/selftests/powerpc/ptrace/core-pkey.c
> 
.snip...

RP

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
