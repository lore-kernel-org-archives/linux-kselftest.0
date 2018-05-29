From: andr2000 at gmail.com (Oleksandr Andrushchenko)
Date: Tue, 29 May 2018 14:07:31 +0300
Subject: [PATCH v3] Add udmabuf misc device
In-Reply-To: <20180529105037.uog4tvcckqp5q6fe@sirius.home.kraxel.org>
References: <20180525140808.12714-1-kraxel@redhat.com>
 <0ad0606e-3201-e203-ec93-8718d7938751@gmail.com>
 <20180529105037.uog4tvcckqp5q6fe@sirius.home.kraxel.org>
Message-ID: <64c362be-449c-15cb-2673-a5c20b7509eb@gmail.com>

On 05/29/2018 01:50 PM, Gerd Hoffmann wrote:
>    Hi,
>
>>> +config UDMABUF
>>> +	bool "userspace dmabuf misc driver"
>>> +	default n
>>> +	depends on DMA_SHARED_BUFFER
>> Don't you want "select DMA_SHARED_BUFFER" here instead?
> Why do you think so?
After thinking a bit more your code looks ok,
sorry for the noise
> cheers,
>    Gerd
>

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
