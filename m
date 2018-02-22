From: mingo@kernel.org (Ingo Molnar)
Date: Thu, 22 Feb 2018 06:51:35 +0100
Subject: [PATCH v12 01/22] selftests/x86: Move protecton key selftest to
 arch neutral directory
In-Reply-To: <1519264541-7621-2-git-send-email-linuxram@us.ibm.com>
References: <1519264541-7621-1-git-send-email-linuxram@us.ibm.com>
 <1519264541-7621-2-git-send-email-linuxram@us.ibm.com>
Message-ID: <20180222055135.6m43xt3mt47sz37q@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180222055135.SyYoCttYe_G2-uI40JjmyaVhCUR1TDNIsgr-1-L8Kgo@z>


* Ram Pai <linuxram@us.ibm.com> wrote:

> cc: Dave Hansen <dave.hansen at intel.com>
> cc: Florian Weimer <fweimer at redhat.com>
> Signed-off-by: Ram Pai <linuxram at us.ibm.com>
> ---
>  tools/testing/selftests/vm/Makefile           |    1 +
>  tools/testing/selftests/vm/pkey-helpers.h     |  223 ++++
>  tools/testing/selftests/vm/protection_keys.c  | 1407 +++++++++++++++++++++++++
>  tools/testing/selftests/x86/Makefile          |    2 +-
>  tools/testing/selftests/x86/pkey-helpers.h    |  223 ----
>  tools/testing/selftests/x86/protection_keys.c | 1407 -------------------------
>  6 files changed, 1632 insertions(+), 1631 deletions(-)
>  create mode 100644 tools/testing/selftests/vm/pkey-helpers.h
>  create mode 100644 tools/testing/selftests/vm/protection_keys.c
>  delete mode 100644 tools/testing/selftests/x86/pkey-helpers.h
>  delete mode 100644 tools/testing/selftests/x86/protection_keys.c

Acked-by: Ingo Molnar <mingo at kernel.org>

Thanks,

	Ingo
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
