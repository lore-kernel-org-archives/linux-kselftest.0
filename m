Received: from mail-oo1-f100.google.com (mail-oo1-f100.google.com [209.85.161.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51A53F4841
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 20:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789417457; cv=none; b=Xw9+YsN0kkRW51kROvIe3J1yNyMnv2/wvj6X80jrq7h6TLc9WlohTjq+ZOxJcnt2n3DSMVVfGQnPYg3bFz/yoEUmX5zmMPVwq++f/D+cEFw5m2oiLf20tv7xqYxp1ojSBECwlchoHH+SUEnQZqBPwL5bOfSXQAGinCDh1d8kexQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789417457; c=relaxed/simple;
	bh=V6WNtKQ4jADi8tTtCkgNPx6V5ss41Ldy2khPHqgLAco=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MUlMPylwpHxwZKflS/uIJW8DH0QT6eGSdub4H642aKEZ/dOq7sew4yTH0YmtzRQ6Fu4G9N9fRkpl9gkH6TsxH0XDt65RtJOXaULijbW23Em6H4tuiikBH7afOKK7P7PwK6p659htpekndoXignnu1qkV9p8Te1N9M16s2xVbfbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=LXXWgAtR; arc=none smtp.client-ip=209.85.161.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="LXXWgAtR"
Received: by mail-oo1-f100.google.com with SMTP id 006d021491bc7-6b128dd0cb1so2635207eaf.3
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 13:24:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789417454; x=1790022254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zKVHktddFg18lNwT1KKe1iRzZT/GYvNrBGD0jhLiuz0=;
        b=TW0iynVL8IfLGn/jgGmTWHeydKEay3GJU1frZNrhyI8DYkxLGC3kFNs3Vc5AA+ip5a
         Len3mqeF9taZv7wsbb1+10eS315wCYinCfGV1Y2W8Ttz5Ja+/hx8YCylg5iCjsq7QsKL
         65ZfZETCUWicUqSZJtiU1ZCNTS/vLiVYetkVBjQvfQwLqdoGF6uwrLZMK8Hr0vcKqSZ6
         TvHPPYfRD4RcTAjd4iG5RZ+VWWHkZfJayBoqdETyKHIk3yyngt488WIdi13dbUQ+MC6X
         7pVNzTtVc91uE15l0tOpz6bY6457/jVh2rGvhCd6fG4UDgf79UBbBUcHsbuOBSF8OWXQ
         bhMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxD07QIQOA/io3vCXAHWYEeGDnPuQnIWj9U4+nOnRxUc+u8qLlEibq+kknbiXnOM/FUmaEthy8WkW8x4J4YET0=@vger.kernel.org
X-Gm-Message-State: AFuF++kbw2EIE4YXYC44Cy14IP6soiJQ9MeLyn8DPYHneo94baXeuiJj
	s7QKEcXREmR25u+j3saR4p5CjqGpNFEFfAbkcfGcJdP9UKesuecwTm3bTkjgdffLFTWePnB+MRc
	LkR7FE75UZ/Yxd4vIyITgOgF4qXwFUAPB5g5uRmC31j5CInlWF4f5XgScUGcxZVLzOP72xzoRUB
	99MF4pvUjP8BBtW8NBJT0ycQCnrqJXBxU/Mx+rwoIHzxiXD0Wi0oLs2kK+xo6Isi6VtOLwFJjOu
	+RAznWZnu0eDpXRzwvGPWAheQ==
X-Gm-Gg: AYBFou0h8HYCbmbhj14Wu9Y75rm3P8v4Hx0GVGnHTh7oeFhxfrrxBTsSOApWYh47YJg
	F/XwSFgOMlCpFAZu8GAt0aPAYOtuHpv8gopmSigRUN1lySfQAkck0nWiBDRYIJ63S6JBuxANPoE
	8Ht4wQMcgMLhMayCIX1ji60MccfPpRxhhGHMiI9dB9NJew/XSt/38ADzAJE59cRRM3vlGk26cL6
	OxxdSAvzrDvgk/Z6U03Z4ChejN6ODp4OLu2ErxwnPJmap+prpFQvFWAC0/Y84O6x8zL0PL2Au7C
	8dC/TXQTozlFAkWIq8lxEFGEDbgYLOZV7aDWq3zSasktmKVX2rTQc/CqMeA15KmBySrNW3u0A2P
	1v7scoxTv6PvELIvhYofSte6eBgbbXvh8ZfbW2H/rpyo7J/jreooUKDRzYLeOnaJ2GQwT6bjuwq
	B/CAV2Gt230cGPcj+dIBpHElfRMpgTE9BrbwP41g==
X-Received: by 2002:a05:6820:16ab:b0:6be:4202:801c with SMTP id 006d021491bc7-6c542342ba3mr2606795eaf.32.1789417454463;
        Mon, 14 Sep 2026 13:24:14 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-29.dlp.protect.broadcom.com. [144.49.247.29])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-47df63d9824sm175174fac.2.2026.09.14.13.24.13
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Sep 2026 13:24:14 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-46f178d813bso3740223fac.3
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 13:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789417453; x=1790022253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zKVHktddFg18lNwT1KKe1iRzZT/GYvNrBGD0jhLiuz0=;
        b=LXXWgAtRdDLCS8M+l7EHZkrjJ0md5DM6P12pvUYV/yqlSiJZzKI9jQtiW8121zi/3a
         ISyjZv7RmlC2me1nHS6+/nGoB71K7mGcF0sEM/y2jgr5cO1nymFI39XwoAuPK6LySWiy
         mXfRbz4KrbuufZcFhrGGWjHrTaM0Gy72TYkE8=
X-Forwarded-Encrypted: i=1; AKwUvBzIZ7cIblRUi/MMxv5ixel8u5BTycIrLDOhAV1yQXFOF9RlDenFrPU3lyNf2Rc4UHsYWsJnKJ2SRW0a0DW3P08=@vger.kernel.org
X-Received: by 2002:a05:6871:580e:b0:481:1dfe:89f5 with SMTP id 586e51a60fabf-481f990179fmr2535703fac.20.1789417452838;
        Mon, 14 Sep 2026 13:24:12 -0700 (PDT)
X-Received: by 2002:a05:6871:580e:b0:481:1dfe:89f5 with SMTP id 586e51a60fabf-481f990179fmr2535682fac.20.1789417452313;
        Mon, 14 Sep 2026 13:24:12 -0700 (PDT)
Received: from lvn-dbc2489.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699bc6sm11623741fac.3.2026.09.14.13.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:24:11 -0700 (PDT)
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
Subject: [PATCH v3 0/4] misc: vmw_zerocopy: VMware zero-copy buffer sharing driver
Date: Mon, 14 Sep 2026 13:22:05 -0700
Message-ID: <cover.1789413109.git.rishi.chhibber@broadcom.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Summary of changes:
- 1/4 reserves a VMCI datagram resource id for the hypervisor-side
  zero-copy service
- 2/4 adds the vmw_zerocopy driver: /dev/vmw_zc, a single ioctl, page
  pinning and the VMCI datagram transport
- 3/4 documents the userspace interface
- 4/4 adds a kselftest covering the ioctl input-validation paths

This series adds a misc character device, /dev/vmw_zc, that lets guest
userspace hand a buffer to a VMware hypervisor-side peer without copying
it. The driver pins the user pages, collects their guest physical frame
numbers and sends that list over a VMCI datagram; the hypervisor then
reads the buffer directly out of guest memory. An optional metadata
buffer is pinned writable so the peer can return a result through the
same mechanism.

Why not vsock or virtio: this is not paravirtual I/O. The guest is not
sending data to a virtual device; it hands page frame numbers to the
hypervisor and reads the results back inline in those same pages, with
no copy and no ring buffer. Two properties have no mapping onto an
existing virtio device type:

- PFN-level zero copy without ownership transfer. virtio-vsock copies
  through the virtqueue ring. virtio-mem and virtio-balloon transfer
  page ownership to the host; here the guest keeps its pages and unpins
  them when the ioctl returns.
- Per-ioctl synchronous feedback. The metadata pages are pinned
  writable and the peer stores status directly into them, so userspace
  reads the result on ioctl return. storvsc and hv_balloon return
  status in a separate ring packet instead; Xen gntdev's writable
  grants and UNMAP_NOTIFY_CLEAR_BYTE serve persistent ring lifecycles,
  not per-call results.

The established upstream shape for this is a thin guest driver over the
vendor's native transport: Hyper-V builds a PFN list for the host with
vmbus_establish_gpadl(), Xen shares frames through the grant table and
exposes that to userspace in gntdev, and VMware already has vmxnet3,
vmw_pvscsi and vmw_balloon on its own protocols. This driver is the
VMCI equivalent. Discussed in full in the v2 thread (linked below);
2/4 carries the short form.

v2 was posted as a single patch and is split here into a reviewable
series along file boundaries: every file belongs entirely to one patch,
so each commit builds on its own. 1/4 comes first because 2/4 sends to
the resource id it reserves, and because it has a different maintainer
set. vmw_zerocopy_core.c and vmw_zerocopy_vmci.c stay in one patch as
they form a single module and reference each other.

Changes since v2:
- Split the single patch into this four-patch series
- The destination is now owned by the kernel: the userspace-supplied
  peer_id is gone, and that word is a reserved field that must be zero
- Dropped VMW_ZC_MSG_INIT and struct vmw_zc_ioctl_config; the device
  needs no configuration step
- Release metadata pages with unpin_user_pages_dirty_lock(..., true);
  the peer stores through the physical frame, so nothing else marks
  those pages dirty
- Split the VMCI transport out behind a small transport ops struct
- Dropped the out-of-tree KBUILD_EXTMOD build logic from
  drivers/misc/Makefile (Greg Kroah-Hartman)
- Removed __user from struct vmw_zc_guest_raw_buffer; it has no place
  in an ioctl structure (Greg Kroah-Hartman)
- Registered ioctl magic 0xDC in ioctl-number.rst
- Added driver documentation (3/4) and a selftest (4/4)
- Rebased onto v7.3-rc3

Userspace built against the v2 header must be rebuilt: the peer_id field
and the configuration ioctl it used no longer exist. Nothing is merged
upstream, so no stable ABI is affected.

Testing:
- Every commit builds on x86_64 with CONFIG_VMW_ZC=m, and
  make headers_install succeeds at each one
- checkpatch.pl --strict reports nothing on 1/4 and 2/4; on 3/4 and 4/4
  only the MAINTAINERS advisory for newly added files
- The selftest builds, and skips cleanly when /dev/vmw_zc is absent

Link to v2:
https://lore.kernel.org/lkml/20260619182710.2498154-1-rishi.chhibber@broadcom.com/

Transport choice, discussed in the v2 thread:
https://lore.kernel.org/lkml/CABJwUKKCwGxYB0is-U84EgAm6Co9_bfxbkZi56jZNLkzihDRyw@mail.gmail.com/

Rishi Chhibber (4):
  misc: vmw_vmci: Reserve a datagram resource id for zero-copy buffer
    sharing
  misc: vmw_zerocopy: Add VMware zero-copy buffer sharing driver
  Documentation: misc: Add vmw_zerocopy driver documentation
  selftests: misc: Add vmw_zerocopy selftest

 Documentation/misc-devices/index.rst          |   1 +
 Documentation/misc-devices/vmw_zerocopy.rst   | 278 ++++++++++++++++++
 .../userspace-api/ioctl/ioctl-number.rst      |   1 +
 MAINTAINERS                                   |  10 +
 drivers/misc/Kconfig                          |  23 ++
 drivers/misc/Makefile                         |   2 +
 drivers/misc/vmw_zerocopy_core.c              | 267 +++++++++++++++++
 drivers/misc/vmw_zerocopy_priv.h              |  66 +++++
 drivers/misc/vmw_zerocopy_vmci.c              | 132 +++++++++
 include/linux/vmw_vmci_defs.h                 |   3 +-
 include/uapi/linux/vmw_zerocopy.h             |  67 +++++
 tools/testing/selftests/Makefile              |   1 +
 .../drivers/misc/vmw_zerocopy/.gitignore      |   1 +
 .../drivers/misc/vmw_zerocopy/Makefile        |  20 ++
 .../drivers/misc/vmw_zerocopy/config          |   2 +
 .../misc/vmw_zerocopy/test_vmw_zerocopy.c     | 276 +++++++++++++++++
 16 files changed, 1149 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/misc-devices/vmw_zerocopy.rst
 create mode 100644 drivers/misc/vmw_zerocopy_core.c
 create mode 100644 drivers/misc/vmw_zerocopy_priv.h
 create mode 100644 drivers/misc/vmw_zerocopy_vmci.c
 create mode 100644 include/uapi/linux/vmw_zerocopy.h
 create mode 100644 tools/testing/selftests/drivers/misc/vmw_zerocopy/.gitignore
 create mode 100644 tools/testing/selftests/drivers/misc/vmw_zerocopy/Makefile
 create mode 100644 tools/testing/selftests/drivers/misc/vmw_zerocopy/config
 create mode 100644 tools/testing/selftests/drivers/misc/vmw_zerocopy/test_vmw_zerocopy.c


base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.52.0

