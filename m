From: davem@davemloft.net (David Miller)
Date: Thu, 14 Feb 2019 09:03:37 -0800 (PST)
Subject: [PATCH net] selftests: fix timestamping Makefile
In-Reply-To: <20190213170914.11991-1-deepa.kernel@gmail.com>
References: <20190213170914.11991-1-deepa.kernel@gmail.com>
Message-ID: <20190214.090337.1833242037236355989.davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190214170337.kHAekIb3gnAWQYN9_6sDTfQMxUNcdmZg6q3e4cWOAjQ@z>

From: Deepa Dinamani <deepa.kernel@gmail.com>
Date: Wed, 13 Feb 2019 09:09:13 -0800

> The clean target in the makefile conflicts with the generic
> kselftests lib.mk, and fails to properly remove the compiled
> test programs.
> 
> Remove the redundant rule, the TEST_GEN_FILES will be already
> removed by the CLEAN macro in lib.mk.
> 
> Signed-off-by: Deepa Dinamani <deepa.kernel at gmail.com>

Applied, thank you.
