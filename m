From: kraxel@redhat.com (Gerd Hoffmann)
Date: Tue, 29 May 2018 12:50:37 +0200
Subject: [PATCH v3] Add udmabuf misc device
In-Reply-To: <0ad0606e-3201-e203-ec93-8718d7938751@gmail.com>
References: <20180525140808.12714-1-kraxel@redhat.com>
 <0ad0606e-3201-e203-ec93-8718d7938751@gmail.com>
Message-ID: <20180529105037.uog4tvcckqp5q6fe@sirius.home.kraxel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180529105037.FbVbzGuu2JxZuZnLiUajLX_c8je-ARVaU8GYtr5Cwuw@z>

  Hi,

> > +config UDMABUF
> > +	bool "userspace dmabuf misc driver"
> > +	default n
> > +	depends on DMA_SHARED_BUFFER
> Don't you want "select DMA_SHARED_BUFFER" here instead?

Why do you think so?

cheers,
  Gerd

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
