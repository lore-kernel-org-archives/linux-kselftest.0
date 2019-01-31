From: logang@deltatee.com (Logan Gunthorpe)
Date: Thu, 31 Jan 2019 13:48:31 -0700
Subject: [PATCH 0/9] Support using MSI interrupts in ntb_transport
In-Reply-To: <345197a6-89e6-c0de-5f7b-a646b5f396c9@intel.com>
References: <20190131185656.17972-1-logang@deltatee.com>
 <345197a6-89e6-c0de-5f7b-a646b5f396c9@intel.com>
Message-ID: <bafe9db4-6d5b-0453-d7e7-e49e9293dd01@deltatee.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190131204831.7ZPWL4pCKE5qHz5SiBGg8laQtywE6df5as0j8AtRJXg@z>



On 2019-01-31 1:20 p.m., Dave Jiang wrote:
> Does this work when the system moves the MSI vector either via software 
> (irqbalance) or BIOS APIC programming (some modes cause round robin 
> behavior)?


I don't know how irqbalance works, and I'm not sure what you are
referring to by BIOS APIC programming, however I would expect these
things would not be a problem.

The MSI code I'm presenting here doesn't do anything crazy with the
interrupts, it allocates and uses them just as any PCI driver would. The
only real difference here is that instead of a piece of hardware sending
the IRQ TLP, it will be sent through the memory window (which, from the
OS's perspective, is just coming from an NTB hardware proxy alias).

Logan
