From: shuah@kernel.org (Shuah Khan)
Date: Tue, 10 Jul 2018 08:08:27 -0600
Subject: [PATCH 0/3] fix selftests compiling errors and warnings
In-Reply-To: <e8ac4e1d-e923-6f78-005c-e8267463a9c9@cn.fujitsu.com>
References: <1530503634-32241-1-git-send-email-lizhijian@cn.fujitsu.com>
 <e8ac4e1d-e923-6f78-005c-e8267463a9c9@cn.fujitsu.com>
Message-ID: <f3800c8a-0a7a-02ce-a285-5b65c20f626c@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180710140827.plSTIhTGbkWUc8NnVuqFiz6N0Fji2YV9_sE_4pAwjRg@z>

On 07/10/2018 02:38 AM, Li Zhijian wrote:
> ping
> 
> 
> On 07/02/2018 11:53 AM, Li Zhijian wrote:
>> Li Zhijian (3):
>>    selftests/android: fix compiling error
>>    selftests/android: initialize heap_type to avoid compiling warning
>>    selftests/gpio: unset OUTPUT for build tools/gpio
>>
>>   tools/testing/selftests/android/ion/Makefile        | 5 ++++-
>>   tools/testing/selftests/android/ion/ionapp_export.c | 7 +++++++
>>   tools/testing/selftests/gpio/Makefile               | 2 +-
>>   3 files changed, 12 insertions(+), 2 deletions(-)
>>
> 
> 
> 

I was away on vacation all of last week. I will review the series.
Anders Roxell is working on making the change at the main Makefile
level to handle the headers dependency. I have been waiting to hear
from Maintainers to Ack it.

Once Anders patch goes in, is the first and third patches in this series
needed?

No problems with the second one. I can get that in soon.

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
