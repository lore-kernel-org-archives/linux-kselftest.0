From: lizhijian@cn.fujitsu.com (Li Zhijian)
Date: Tue, 10 Jul 2018 16:38:50 +0800
Subject: [PATCH 0/3] fix selftests compiling errors and warnings
In-Reply-To: <1530503634-32241-1-git-send-email-lizhijian@cn.fujitsu.com>
References: <1530503634-32241-1-git-send-email-lizhijian@cn.fujitsu.com>
Message-ID: <e8ac4e1d-e923-6f78-005c-e8267463a9c9@cn.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180710083850.WSCo-kqdS8zwlxtkv7UalVkQqMBtgDHY5F5dkpZCNoA@z>

ping


On 07/02/2018 11:53 AM, Li Zhijian wrote:
> Li Zhijian (3):
>    selftests/android: fix compiling error
>    selftests/android: initialize heap_type to avoid compiling warning
>    selftests/gpio: unset OUTPUT for build tools/gpio
>
>   tools/testing/selftests/android/ion/Makefile        | 5 ++++-
>   tools/testing/selftests/android/ion/ionapp_export.c | 7 +++++++
>   tools/testing/selftests/gpio/Makefile               | 2 +-
>   3 files changed, 12 insertions(+), 2 deletions(-)
>


--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
