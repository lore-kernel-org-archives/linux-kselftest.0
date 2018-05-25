From: davem at davemloft.net (David Miller)
Date: Fri, 25 May 2018 15:11:48 -0400 (EDT)
Subject: [PATCH net] selftests/net: Add missing config options for PMTU
 tests
In-Reply-To: <53b70df32d1d92df98a9c8deaae90e9e7ad37fbc.1527170629.git.sbrivio@redhat.com>
References: <53b70df32d1d92df98a9c8deaae90e9e7ad37fbc.1527170629.git.sbrivio@redhat.com>
Message-ID: <20180525.151148.495699913689171439.davem@davemloft.net>

From: Stefano Brivio <sbrivio at redhat.com>
Date: Thu, 24 May 2018 16:10:12 +0200

> PMTU tests in pmtu.sh need support for VTI, VTI6 and dummy
> interfaces: add them to config file.
> 
> Reported-by: Naresh Kamboju <naresh.kamboju at linaro.org>
> Fixes: d1f1b9cbf34c ("selftests: net: Introduce first PMTU test")
> Signed-off-by: Stefano Brivio <sbrivio at redhat.com>

Applied, thank you.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
