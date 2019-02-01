From: joro at 8bytes.org (Joerg Roedel)
Date: Fri, 1 Feb 2019 17:44:01 +0100
Subject: [PATCH 1/9] iommu/vt-d: Allow interrupts from the entire bus for
 aliased devices
In-Reply-To: <20190131185656.17972-2-logang@deltatee.com>
References: <20190131185656.17972-1-logang@deltatee.com>
 <20190131185656.17972-2-logang@deltatee.com>
Message-ID: <20190201164401.GT32526@8bytes.org>

On Thu, Jan 31, 2019 at 11:56:48AM -0700, Logan Gunthorpe wrote:
> @@ -394,6 +402,10 @@ static int set_msi_sid(struct irte *irte, struct pci_dev *dev)
>  		set_irte_sid(irte, SVT_VERIFY_BUS, SQ_ALL_16,
>  			     PCI_DEVID(PCI_BUS_NUM(data.alias),
>  				       dev->bus->number));
> +	else if (data.count >= 2 && data.busmatch_count == data.count)
> +		set_irte_sid(irte, SVT_VERIFY_BUS, SQ_ALL_16,
> +			     PCI_DEVID(dev->bus->number,
> +				       dev->bus->number));

The dev->bus->number argument for the devfn parameter of PCI_DEVID is
not needed, right?

Also, this requires at least a comment to document that special case.


	Joerg
