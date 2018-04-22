From: tom.hromatka@oracle.com (Tom Hromatka)
Date: Sun, 22 Apr 2018 15:52:49 -0600
Subject: [PATCH v4 1/2] char: sparc64: Add privileged ADI driver
In-Reply-To: <20180421090449.GA8194@kroah.com>
References: <20180420205221.488589-1-tom.hromatka@oracle.com>
 <20180420205221.488589-2-tom.hromatka@oracle.com>
 <20180421090449.GA8194@kroah.com>
Message-ID: <7241fc77-c38c-abdb-d8dc-4b22dac36895@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180422215249.oy4dGvkQdihqXo_uhsRn2-o9cCw9bu_r6ektIu2nnxQ@z>



On 04/21/2018 03:04 AM, Greg KH wrote:
> On Fri, Apr 20, 2018@02:52:20PM -0600, Tom Hromatka wrote:
>> --- /dev/null
>> +++ b/drivers/char/adi.c
>> @@ -0,0 +1,240 @@
>> +// SPDX-License-Identifier: GPL-2.0
> Good, but:
>
>> +MODULE_LICENSE("GPL");
> That's the wrong line :(
>
> Read include/linux/module.h for the correct string to put here for a
> GPL version 2 only module.
>

<Tom hangs his head in shame>

My sincerest apologies, Greg.  I'll follow the guidance from
the aforementioned file and re-re-submit the patch tomorrow :(.

Thanks so much for your patience.

Regards,

Tom
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
