From: shuah at kernel.org (shuah)
Date: Fri, 24 May 2019 18:06:39 -0600
Subject: [PATCH v2 1/3] kselftest/cgroup: fix unexpected testing failure
 on test_memcontrol
In-Reply-To: <0c6b76b8-e20c-33f0-21da-64a5d5da30a9@kernel.org>
References: <20190520030140.203605-1-alex.shi@linux.alibaba.com>
 <20190520030140.203605-2-alex.shi@linux.alibaba.com>
 <20190524214035.GG374014@devbig004.ftw2.facebook.com>
 <0c6b76b8-e20c-33f0-21da-64a5d5da30a9@kernel.org>
Message-ID: <ea5514c1-80a1-3c41-de1c-43582b6f1a49@kernel.org>

On 5/24/19 3:44 PM, shuah wrote:
> On 5/24/19 3:40 PM, Tejun Heo wrote:
>> Hello,
>>
>> All three patches look good to me.  Please feel free to add my
>> acked-by.  Shuah, should I route these through cgroup tree or would
>> the kselftest tree be a better fit?
>>
>> Thanks.
>>
> 
> 
> Tejun, I can take them through kselftest tree.
> 

Alex,

patches 1/3 and 2/3 failed checkpatch. Could you please the warns
and send v3. Go ahead and send all v3 for all 3 patches

thanks,
-- Shuah
