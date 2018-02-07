From: daniel@iogearbox.net (Daniel Borkmann)
Date: Thu, 8 Feb 2018 00:34:57 +0100
Subject: [Linux-kselftest-mirror] [PATCH v2] selftests: bpf:
 test_kmod.sh: check the module path before insmod
In-Reply-To: <1518027334-9814-1-git-send-email-naresh.kamboju@linaro.org>
References: <1518027334-9814-1-git-send-email-naresh.kamboju@linaro.org>
Message-ID: <8a7502bd-6684-cd45-5927-2b0eb7bd6f2f@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180207233457.GsOJxEKSVyrZmR5Cv-j-CL2aCMZbUWVAj38_v9KmoJ8@z>

On 02/07/2018 07:15 PM, Naresh Kamboju wrote:
> test_kmod.sh reported false failure when module not present.
> Check test_bpf.ko is present in the path before loading it.
> 
> Two cases to be addressed here,
> In the development process of test_bpf.c unit testing will be done by
> developers by using "insmod $SRC_TREE/lib/test_bpf.ko"
> 
> On the other hand testers run full tests by installing modules on device
> under test (DUT) and followed by modprobe to insert the modules accordingly.
> 
> Signed-off-by: Naresh Kamboju <naresh.kamboju at linaro.org>

Applied to bpf tree, thanks Naresh!
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
