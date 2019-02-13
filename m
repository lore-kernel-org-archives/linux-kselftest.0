From: logang at deltatee.com (Logan Gunthorpe)
Date: Wed, 13 Feb 2019 10:54:46 -0700
Subject: [PATCH v2 04/12] iommu/vt-d: Allow interrupts from the entire bus for
 aliased devices
In-Reply-To: <20190213175454.7506-1-logang@deltatee.com>
References: <20190213175454.7506-1-logang@deltatee.com>
Message-ID: <20190213175454.7506-5-logang@deltatee.com>

When a device has multiple aliases that all are from the same bus,
we program the IRTE to accept requests from any matching device on the
bus.

This is so NTB devices which can have requests from multiple bus-devfns
can pass MSI interrupts through across the bridge.

Signed-off-by: Logan Gunthorpe <logang at deltatee.com>
Cc: David Woodhouse <dwmw2 at infradead.org>
Cc: Joerg Roedel <joro at 8bytes.org>
Cc: Jacob Pan <jacob.jun.pan at linux.intel.com>
---
 drivers/iommu/intel_irq_remapping.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/iommu/intel_irq_remapping.c b/drivers/iommu/intel_irq_remapping.c
index 5a55bef8e379..2d74641b7f7b 100644
--- a/drivers/iommu/intel_irq_remapping.c
+++ b/drivers/iommu/intel_irq_remapping.c
@@ -368,6 +368,8 @@ static int set_hpet_sid(struct irte *irte, u8 id)
 struct set_msi_sid_data {
 	struct pci_dev *pdev;
 	u16 alias;
+	int count;
+	int busmatch_count;
 };
 
 static int set_msi_sid_cb(struct pci_dev *pdev, u16 alias, void *opaque)
@@ -376,6 +378,10 @@ static int set_msi_sid_cb(struct pci_dev *pdev, u16 alias, void *opaque)
 
 	data->pdev = pdev;
 	data->alias = alias;
+	data->count++;
+
+	if (PCI_BUS_NUM(alias) == pdev->bus->number)
+		data->busmatch_count++;
 
 	return 0;
 }
@@ -387,6 +393,8 @@ static int set_msi_sid(struct irte *irte, struct pci_dev *dev)
 	if (!irte || !dev)
 		return -1;
 
+	data.count = 0;
+	data.busmatch_count = 0;
 	pci_for_each_dma_alias(dev, set_msi_sid_cb, &data);
 
 	/*
@@ -395,6 +403,11 @@ static int set_msi_sid(struct irte *irte, struct pci_dev *dev)
 	 * device is the case of a PCIe-to-PCI bridge, where the alias is for
 	 * the subordinate bus.  In this case we can only verify the bus.
 	 *
+	 * If there are multiple aliases, all with the same bus number,
+	 * then all we can do is verify the bus. This is typical in NTB
+	 * hardware which use proxy IDs where the device will generate traffic
+	 * from multiple devfn numbers on the same bus.
+	 *
 	 * If the alias device is on a different bus than our source device
 	 * then we have a topology based alias, use it.
 	 *
@@ -405,6 +418,8 @@ static int set_msi_sid(struct irte *irte, struct pci_dev *dev)
 	if (PCI_BUS_NUM(data.alias) != data.pdev->bus->number)
 		set_irte_verify_bus(irte, PCI_BUS_NUM(data.alias),
 				    dev->bus->number);
+	else if (data.count >= 2 && data.busmatch_count == data.count)
+		set_irte_verify_bus(irte, dev->bus->number, dev->bus->number);
 	else if (data.pdev->bus->number != dev->bus->number)
 		set_irte_sid(irte, SVT_VERIFY_SID_SQ, SQ_ALL_16, data.alias);
 	else
-- 
2.19.0
