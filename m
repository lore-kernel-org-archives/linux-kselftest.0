Received: from mail-oi1-f226.google.com (mail-oi1-f226.google.com [209.85.167.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0CF3F4841
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 20:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789417464; cv=none; b=KmJR1zFLm/9Ai6l3h/RRE+EMjhTunJrEQkS43olzkL5DgSu//QH9dWXCn+ndVVMcjZCboXm3LraFSVkjd57UdqqQ0h8sP6W1JNAf0wGBoP3SbxGhczhlSyFC99rXn7IeCupGC1m0/oEAQHBmFqWHtYL0qw2i5BHIDfMDF5+1okk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789417464; c=relaxed/simple;
	bh=k2tzbk1Xu7br+97MZVzboFVQLhf+xwYbmmoNash5Lbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rLwNEmRWvjJj6mjPM4yh3HZlQzszeOKSXhvprfiat1tQzYs6SiywUSfm9DR90tLo+urX68h4K5EZEKFnOVLlvYtkSOGZFWdQX77/6zXglS0VLVtc8MjcvwkW1CmDL5uq9/8UqJMjHtFqACwgTxB8zDH2pcjKMRFJ0fOPQ21Ukpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Ox7RP5GA; arc=none smtp.client-ip=209.85.167.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Ox7RP5GA"
Received: by mail-oi1-f226.google.com with SMTP id 5614622812f47-4b38ea4c63aso663873b6e.1
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 13:24:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789417461; x=1790022261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lw4cU/iYb1d+4k9XS51T95AvbCYV5HtwSci4L0F+IcE=;
        b=2xoMhIfCr558C2z0YtjB4zMaTgfmePd+nfHK6uJ87QvpYJq2ZqwjzfjUfFyVxSvYku
         5xbezngA6uJVMkZGu//OUkfIFVeVXcNQH637H9GG8AWEG+QSSp2TV3juN4tjJj3utqNP
         LGnufi+2jOLr3EfYyT0vDDkFfo8jMd9WCF/8EnssGrDt8QnOKoetSBLPI9hN1/nf6Ulo
         tIV2aVC/4GDfFZ80yARFGtCVNvEycxPDDAMQlKB4iH+vILeWOJz1+OAUUSs7ATkUkZQ4
         v1egq8BMscA8DYOeWYdL3aV9Jv9gHMM5J/tT+MwKSOQ4+JdP0OjDzs2iKZFo7K5tZC3n
         kg2g==
X-Forwarded-Encrypted: i=1; AKwUvBz39fvv3D4riKa0TvEuUd8ZSuS+S64ogrrz3N60RO1/7UBicBtKta5ym5hI4UYjLgGDe+lP/ML7TCG/7io6doc=@vger.kernel.org
X-Gm-Message-State: AFuF++n0spaXjjHpnMfLgCVNkthTEssF9SF4Yw7aKmjKe9ihNuKdHJsa
	qLRtIl+J8umY1041lgdOPQom44g72dviMMly1qfh9FKwN/O85rA4vmFiDeiEBu38pVHmLXME3BT
	gxOOciz88IJ7aOk8BsCI40vP1y+Qk7UBOdATb+9+1ee0Aso0fm4KsQ3mHMYggPfNKB2jaLOzjck
	ESN/mdPzkP+5Z1VBpjFQykxZV+lWrq6Dtb4Z48tkASYXriaT1dQ+rGbXKKiv59U8fM7pTTLHWKz
	2zMWyjmF7WVc1igglu00mHnSQ==
X-Gm-Gg: AYBFou2yPLXgeK+KWsh2qDDT45CcaUmuBWTSCCYFScDJPpMu70KemSlAzuaveEJ+UTA
	6OeQbDeegCO9P+XtWBcWUsqaPtY5iLYIVAPw/XwaEb9xZmOhfSfIy2FnSm+aFa7F/PdtUz37aDU
	hwPOppuRUi4ypBpeARpdvfkev1FQSYRTcoTnS+DyndluK/BOcWPYHTym2CoaIwC0uyDqX2v7Rih
	zQ7+YwGVFDZ1Lq4qxiLBDUF6FMDz7HIupBPW4UnmKDfj05N8t/hlHvvcfewcgzfbY0hpit3V2CL
	8kxHZLp4IQWiH3nY/59nZrJtJx4wcueRFS8M75je8ohPFvfT6cgQf2KnaTxoKPE9i10122lN29N
	rPnJLai9HQj72GlVboTvQhkgHSGlPr6fSwi1Xf6rdOS0HRa8zHefKNiTGas5+91HJ8JtyBpAq2q
	3W6v1xwLbccu6XRGlOO5vqyH6FIjTuqLT8eCUC+w==
X-Received: by 2002:a05:6808:f03:b0:4c5:a75f:c5e1 with SMTP id 5614622812f47-4c7b56a1963mr4715735b6e.13.1789417460811;
        Mon, 14 Sep 2026 13:24:20 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-29.dlp.protect.broadcom.com. [144.49.247.29])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-47df930dde7sm162766fac.10.2026.09.14.13.24.19
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Sep 2026 13:24:20 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-47d81384b4bso3752139fac.3
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 13:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789417459; x=1790022259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lw4cU/iYb1d+4k9XS51T95AvbCYV5HtwSci4L0F+IcE=;
        b=Ox7RP5GA1kaNnqbnJyMQpVpqIbSLW5KM5CZ/7pfC+R4XLd9LAuApy2yxuotxRV7pSz
         Yo401mUcfLZtrRR8wr0zTULlYaUs/9hXg4pES+qV8bWlkP7X1PPKjbdXQobXnk1jousa
         79Ii2aoIzK8Sk4Y4Eogw4q9DkCcKgHr5KQtLA=
X-Forwarded-Encrypted: i=1; AKwUvBxpsoz4QyRkjQ2k1bUCy9wU1QklufOU/HLO5KqYKYJSfVXnAZ7DqRLIm2/ar4m7CLJS5bWaVBsj/nMCxK+gzt0=@vger.kernel.org
X-Received: by 2002:a05:6870:44b:b0:47b:dbb4:7cbb with SMTP id 586e51a60fabf-481f9b10f9fmr4289077fac.14.1789417458744;
        Mon, 14 Sep 2026 13:24:18 -0700 (PDT)
X-Received: by 2002:a05:6870:44b:b0:47b:dbb4:7cbb with SMTP id 586e51a60fabf-481f9b10f9fmr4289044fac.14.1789417458237;
        Mon, 14 Sep 2026 13:24:18 -0700 (PDT)
Received: from lvn-dbc2489.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699bc6sm11623741fac.3.2026.09.14.13.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:24:17 -0700 (PDT)
From: Rishi Chhibber <rishi.chhibber@broadcom.com>
To: gregkh@linuxfoundation.org,
	arnd@arndb.de
Cc: bryan-bt.tan@broadcom.com,
	vishnu.dasa@broadcom.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	shuah@kernel.org,
	rdunlap@infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ajay.kaher@broadcom.com,
	alexey.makhalov@broadcom.com,
	vamsi-krishna.brahmajosyula@broadcom.com,
	yin.ding@broadcom.com,
	tapas.kundu@broadcom.com,
	Rishi Chhibber <rishi.chhibber@broadcom.com>
Subject: [PATCH v3 3/4] Documentation: misc: Add vmw_zerocopy driver documentation
Date: Mon, 14 Sep 2026 13:22:08 -0700
Message-ID: <714b2c18a9f4ad7a4adc927941965ef45e8438c7.1789413109.git.rishi.chhibber@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1789413109.git.rishi.chhibber@broadcom.com>
References: <cover.1789413109.git.rishi.chhibber@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Summary of changes:
- Add Documentation/misc-devices/vmw_zerocopy.rst describing the device
  node, the ioctl interface, the message types and the buffer limits
- Link it from Documentation/misc-devices/index.rst

Document the userspace interface of the vmw_zerocopy driver added earlier
in this series: the /dev/vmw_zc device node, the VMW_ZC_IOCTL_MSG ioctl and
its message types, the data and metadata size limits, and an example call
sequence.

The prose also covers the parts of the design that are not apparent from
the interface alone: how a PFN list replaces a data copy, the metadata
feedback path and why those pages need different release handling from the
data pages, the atomic submission semantics of placing both PFN lists in a
single datagram, the transport abstraction, and why the destination
resource id is owned by the kernel rather than selectable by userspace.

Signed-off-by: Rishi Chhibber <rishi.chhibber@broadcom.com>
Reviewed-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
Reviewed-by: Vishnu Dasa <vishnu.dasa@broadcom.com>
---
 Documentation/misc-devices/index.rst        |   1 +
 Documentation/misc-devices/vmw_zerocopy.rst | 278 ++++++++++++++++++++
 2 files changed, 279 insertions(+)
 create mode 100644 Documentation/misc-devices/vmw_zerocopy.rst

diff --git a/Documentation/misc-devices/index.rst b/Documentation/misc-devices/index.rst
index f911edaecbfa..8d1687a2d566 100644
--- a/Documentation/misc-devices/index.rst
+++ b/Documentation/misc-devices/index.rst
@@ -27,4 +27,5 @@ fit into other categories.
    spear-pcie-gadget
    tps6594-pfsm
    uacce
+   vmw_zerocopy
    xilinx_sdfec
diff --git a/Documentation/misc-devices/vmw_zerocopy.rst b/Documentation/misc-devices/vmw_zerocopy.rst
new file mode 100644
index 000000000000..80a6277acf28
--- /dev/null
+++ b/Documentation/misc-devices/vmw_zerocopy.rst
@@ -0,0 +1,278 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+======================================
+VMware Zero-Copy Buffer Sharing Driver
+======================================
+
+Overview
+========
+
+The VMware zero-copy driver (``vmw_zerocopy``) provides a misc character
+device at ``/dev/vmw_zc`` that allows guest userspace to share memory buffers
+with a VMware hypervisor-side peer without copying the payload through a
+kernel bounce buffer.
+
+The driver's responsibilities are strictly bounded:
+
+- Pin the caller's user pages with ``pin_user_pages_fast()``.
+- Collect the physical page frame numbers (PFNs) of those pages.
+- Transmit the PFN list to the hypervisor peer through the driver's
+  transport backend (currently VMCI; see `Transport Abstraction`_).
+- Unpin the pages when the ioctl returns.
+
+The hypervisor reads the payload directly from the guest's physical frames.
+No data is copied into or out of kernel memory.
+
+
+How Zero Copy Works
+===================
+
+A conventional driver copies application data into a kernel buffer and then
+sends that buffer to the device.  This driver does not.
+
+When userspace calls ``VMW_ZC_IOCTL_MSG`` with a ``VMW_ZC_MSG_USER_BUFFER``
+message, the kernel:
+
+1. Calls ``pin_user_pages_fast()`` to pin the data and metadata pages in
+   place, preventing them from being swapped or moved for the duration of
+   the ioctl.
+2. Iterates over the pinned pages and records each page's PFN using
+   ``page_to_pfn()``.
+3. Packs the PFN list into a ``struct vmw_zc_host_message`` and hands it to
+   the transport backend for delivery to the hypervisor peer (currently
+   VMCI's ``vmci_datagram_send()``).
+4. Calls ``unpin_user_pages()`` before returning.
+
+The hypervisor receives the datagram, maps the listed guest-physical frames
+directly, and accesses the buffer contents without any copy traversing the
+guest kernel.  The guest kernel never touches the payload data itself.
+
+
+Metadata Feedback Path
+======================
+
+Each ``VMW_ZC_MSG_USER_BUFFER`` call may supply two separate buffers:
+
+- **data buffer** - the payload the hypervisor will read.  Pages are pinned
+  with ``gup_flags = 0`` (read-only from the caller's perspective).
+- **metadata buffer** - a control region (up to 64 KiB) the hypervisor
+  writes into.  Pages are pinned with ``FOLL_WRITE`` so the hypervisor can
+  store per-operation results directly in the caller's own memory.
+
+Both PFN lists travel in a single VMCI datagram.  The hypervisor, while those
+pages are still pinned, writes per-operation information - such as completion
+status, byte counts, or application-level result codes - directly into the
+metadata pages.
+
+Because the metadata pages are the same physical pages that userspace mapped,
+userspace can read the hypervisor's response immediately after the ioctl
+returns by reading its own buffer.  No additional system call is required to
+retrieve the result.
+
+Key properties of this feedback path:
+
+- **Per-call**: a fresh metadata region is provided with each ioctl, so
+  results from one call do not interfere with another.
+- **Synchronous**: the result is present in the metadata buffer when the
+  ioctl returns; no polling or waiting is required.
+- **In-place**: the hypervisor writes into the caller's own pinned pages;
+  the result does not pass through any intermediate kernel buffer.
+- **Rich**: up to 64 KiB of arbitrary per-operation result data per call.
+
+
+Atomic Submission Semantics
+============================
+
+Both the data PFN list and the metadata PFN list are placed in a single
+``struct vmw_zc_host_message`` and delivered in one transport ``send()``
+call (currently backed by a single ``vmci_datagram_send()``).  The
+hypervisor receives the complete bundle atomically.  There is no state held
+between ioctl calls: if the send fails, nothing has been committed on the
+hypervisor side.  This makes error recovery straightforward for the caller.
+
+
+Transport Abstraction
+=====================
+
+The driver is split along a small internal interface so that VMCI is a
+swappable backend rather than something the ioctl path depends on directly:
+
+- ``vmw_zerocopy_core.c`` owns the misc device, the ioctl, and user page
+  pinning.  It builds a ``struct vmw_zc_host_message`` on the stack and
+  hands it to a transport for delivery.  It contains no VMCI-specific code.
+- ``vmw_zerocopy_vmci.c`` implements delivery over VMCI: creating the
+  driver's VMCI datagram handle, maintaining the per-peer datagram buffers
+  described under `Constraints`_, and calling ``vmci_datagram_send()``.
+
+The two are joined by ``struct vmw_zc_transport_ops``, defined in the
+driver-private ``vmw_zerocopy_priv.h``::
+
+    struct vmw_zc_transport_ops {
+            int  (*init)(void);
+            void (*exit)(void);
+            int  (*send)(const struct vmw_zc_host_message *msg);
+    };
+
+VMCI is currently the only transport, selected at compile time with
+``vmw_zc_transport = &vmw_zc_vmci_transport`` in ``vmw_zerocopy_core.c``.
+The destination is owned entirely by the transport backend, so ``send()`` takes
+no address argument.  Adding a second transport means implementing this
+interface in a new source file and pointing ``vmw_zc_transport`` at it - the
+ioctl, pinning, and message-building code do not change.
+
+
+Use Cases
+=========
+
+This driver is suited to workloads where:
+
+- A guest application needs to hand large buffers to a VMware hypervisor
+  service without incurring a kernel-to-kernel copy of the payload.
+- Per-operation completion feedback (status, byte count, result code) is
+  required synchronously with the send, without a separate receive call.
+- The metadata region is bounded (<= 64 KiB) and the response latency must be
+  bounded by the ioctl round-trip rather than by a polling interval.
+
+Examples include guest-side offload of data transformation, checksum, or
+inspection workloads where the hypervisor peer processes each buffer and
+reports the outcome directly into the caller's metadata page.
+
+
+Userspace API
+=============
+
+Device
+------
+
+The driver registers a misc character device::
+
+    /dev/vmw_zc
+
+The device is created with mode ``0644`` so that unprivileged guest
+userspace can open it without additional privilege.
+
+ioctl
+-----
+
+All operations use a single ioctl::
+
+    ioctl(fd, VMW_ZC_IOCTL_MSG, &msg)
+
+where ``msg`` is a ``struct vmw_zc_guest_message`` defined in
+``include/uapi/linux/vmw_zerocopy.h``.
+
+Addressing the peer
+-------------------
+
+Userspace does not address the peer.  The destination is a compile-time
+constant owned by the transport backend, and there is no initialisation call
+and no per-message address field.
+
+This is deliberate.  The destination is a VMCI resource ID in the hypervisor
+context, and that namespace belongs to the platform: low IDs are the
+hypervisor's own control entry points.  A device node that unprivileged
+userspace can open must therefore not let userspace name a destination, or it
+becomes an unfiltered writer onto the hypervisor's control namespace.
+``msg.reserved`` exists only to keep the structure layout fixed and must be
+zero; a non-zero value returns ``-EINVAL``.
+
+Message types
+-------------
+
+``VMW_ZC_MSG_USER_BUFFER``
+  Transfer a buffer, with optional metadata feedback.  Fill
+  ``msg.u.data`` as follows:
+
+  =====================  =================================================
+  Field                  Meaning
+  =====================  =================================================
+  ``buffer``             ``__u64`` userspace address of the data buffer;
+                         0 if no data buffer.
+  ``buffer_length``      Length in bytes; 1-65536 (64 KiB maximum).
+  ``metadata``           ``__u64`` userspace address of the metadata buffer;
+                         0 if no metadata buffer.
+  ``metadata_length``    Length in bytes; 1-65536 (64 KiB maximum).
+  =====================  =================================================
+
+  At least one of ``buffer`` or ``metadata`` must be non-zero.
+  The metadata buffer must remain mapped for the duration of the ioctl; the
+  hypervisor may write into it at any point while the call is in progress.
+
+``VMW_ZC_MSG_RAW``
+  Send a small inline payload (<= 36 bytes) to the peer without pinning any
+  user pages.  Fill ``msg.u.raw_buffer.raw_buffer`` with the payload and
+  set ``msg.u.raw_buffer.raw_len`` to the payload length.  Useful for
+  lightweight control or signaling messages.
+
+Pointer fields (``buffer``, ``metadata``) are declared as ``__u64`` so that
+``struct vmw_zc_guest_message`` has the same layout on 32-bit and 64-bit
+userspace.  The argument pointer itself still needs conversion for 32-bit
+callers, so ``.compat_ioctl`` is set to ``compat_ptr_ioctl``.
+
+Example call sequence
+---------------------
+
+The following pseudo-code illustrates the typical usage pattern::
+
+    /* Step 1: open the device */
+    fd = open("/dev/vmw_zc", O_RDWR);
+
+    /* Step 2: allocate data and metadata buffers */
+    void *data     = mmap(NULL, DATA_SIZE,     PROT_READ,             ...);
+    void *metadata = mmap(NULL, METADATA_SIZE, PROT_READ | PROT_WRITE,...);
+    /* fill data buffer with payload */
+
+    /* Step 3: transfer the buffer and wait for metadata feedback.
+     * There is no destination to supply; the driver owns it.
+     */
+    struct vmw_zc_guest_message xfer_msg = {
+        .message_type = VMW_ZC_MSG_USER_BUFFER,
+        .u.data = {
+            .buffer          = (uint64_t)(uintptr_t)data,
+            .buffer_length   = DATA_SIZE,
+            .metadata        = (uint64_t)(uintptr_t)metadata,
+            .metadata_length = METADATA_SIZE,
+        },
+    };
+    ioctl(fd, VMW_ZC_IOCTL_MSG, &xfer_msg);
+
+    /* Step 4: read the result - no extra syscall needed */
+    struct my_result *res = (struct my_result *)metadata;
+    if (res->status == 0)
+        /* success */;
+
+
+Constraints
+===========
+
+**One destination, fixed by the driver.**
+The peer is not selectable by userspace; see "Addressing the peer" above.
+The send path builds its datagram on the stack per call, so it performs no
+allocation, holds no driver lock, and has no shared mutable state.  Concurrent
+senders are serialised only where the VMCI transport itself serialises them.
+
+**Send-only.**
+The driver transmits PFN descriptors to the hypervisor; it does not receive
+datagrams.  Hypervisor responses are delivered through the metadata writeback
+path described above, not through a kernel receive queue.
+
+**Buffer size limits.**
+Data and metadata buffers are both capped at 64 KiB (``SZ_64K``).  These limits
+bound the worst-case VMCI datagram size and the number of pages that must
+remain pinned during the ioctl.
+
+**Inline raw payload limit.**
+The ``VMW_ZC_MSG_RAW`` message carries at most 36 bytes
+(``VMW_ZC_MAX_RAW_BUFFER_LEN``).
+
+**Incompatible with encrypted guest memory.**
+The driver's correctness depends on the hypervisor being able to read and
+write guest physical pages.  Hardware memory encryption (AMD SEV-SNP, Intel
+TDX) intentionally prevents this.  The Kconfig dependency
+``depends on !X86_MEM_ENCRYPT`` enforces this constraint at build time and
+prevents the module from being enabled in encrypted-memory guests.
+
+**x86 only.**
+The driver depends on ``CONFIG_X86`` and ``CONFIG_HYPERVISOR_GUEST``.  Its
+current transport backend uses ``VMWARE_VMCI`` (see `Transport
+Abstraction`_), which is an x86 VMware platform interface.
-- 
2.52.0

