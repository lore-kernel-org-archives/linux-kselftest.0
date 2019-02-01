From: helgaas at kernel.org (Bjorn Helgaas)
Date: Fri, 1 Feb 2019 13:23:23 -0600
Subject: [PATCH 2/9] PCI/MSI: Support allocating virtual MSI interrupts
In-Reply-To: <74993e67-cdc5-234a-d26c-5c0177a0299a@deltatee.com>
References: <20190131185656.17972-1-logang@deltatee.com>
 <20190131185656.17972-3-logang@deltatee.com>
 <20190131223932.GR229773@google.com>
 <74993e67-cdc5-234a-d26c-5c0177a0299a@deltatee.com>
Message-ID: <20190201192323.GS229773@google.com>

On Thu, Jan 31, 2019 at 03:52:09PM -0700, Logan Gunthorpe wrote:
> On 2019-01-31 3:39 p.m., Bjorn Helgaas wrote:
> >> diff --git a/include/linux/msi.h b/include/linux/msi.h
> >> index 784fb52b9900..6458ab049852 100644
> >> --- a/include/linux/msi.h
> >> +++ b/include/linux/msi.h
> >> @@ -88,6 +88,7 @@ struct msi_desc {
> >>  				__u8	multi_cap	: 3;
> >>  				__u8	maskbit		: 1;
> >>  				__u8	is_64		: 1;
> >> +				__u8    is_virtual      : 1;
> > 
> > You did the right thing by using the same style as what's already
> > here, but does anybody know why are we using __u8 and __u16 here?
> > 
> > Those typedefs are in include/uapi/asm-generic/int-l64.h, which
> > suggests they're for things exported to user space, but I don't think
> > that's the case here, so I'm wondering if we could someday replace
> > these with u8 and u16.  Obviously that wouldn't be part of *this*
> > series.
> 
> Yes, I was also confused by this. But I always follow the "when-in-rome"
> rule. 

Thanks for following the "when-in-rome" rule.  That seems so obvious
that it wouldn't even need to be written down, but it is often
ignored.

> My understanding is the same as yours is that __u8 should be used
> for userspace compatibility which doesn't apply here. If there is
> consensus on this being wrong, I'd be happy to write a cleanup patch
> that fixes it separate from this series.

That'd be awesome.  There are also a couple more in pci-driver.c that
could be fixed at the same time.

Bjorn
