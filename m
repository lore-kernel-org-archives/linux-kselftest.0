Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFE7500AAF
	for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 14:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419832; cv=none; b=ORbUfwB+jqX99S+4qX8Bo2Ab2ZJBZXI5qRu4qaUCUcC7CXlLhkMJGESHJnq2CFHMADGl6JnrGLv7Xvlmk3nmessaYhEOpPjLuEtqziSCUxO6IXAINmSXaqldStsu+yOD7rl7J5ODhCrnbrYBvFEvaUqQkTSiQXfPWl5JPFHs6u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419832; c=relaxed/simple;
	bh=oZw5WkstFSQ0MjMjvXdwItfizGF9O/zHM7f3xT+7fVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DrQaLInWP/ugVXI/CmQrvDNp8EzVcxMtfVZ8vYOODn7BCU/MA+7I+rrz9zTLbWagespOtjk0JrF79LCqqpmfnqqhWpQK6MAHVg88g/AotndGDk7AvcBcYBN5dM8JQkmxMU/DOrqfwI2I5X9ObAeF+KyJG6cjqmq2vJW4MDz/g1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Ml511SBs; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Ml511SBs"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5e9528732b4so1800883e0c.0
        for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 07:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792419829; x=1793024629; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ynTwWaih3UWb7VmKOqAZKdwwEp9nTZ8YKOhE35tWuk0=;
        b=Ml511SBs121ed0qKXWQ2MchBZJYue2tK8+rpZEDVGyLeI+P8eAucjVcFkNCGV1G9yN
         ssUGANQ0E86JcTrDSBuD5cL8VFG3TwFZY1C8dyiJOVeJ6EsnQVejL0aN8Smmg6TH3tgk
         jJPy1Sxk2Dpz9UwL9oe6ijj96402F770va9RLb597/GxYFKtHkYVPABsrELT3NKAwtQC
         JbzsVX7vZveFhMCKPQKoKNmAkpLuv4/6NjbsidhjOproMYHto6WQeevU60INFuyTK3Gv
         0A46XWt3aqojTZ0SzC30Gvowy/+ZeSrIpMjBSreViRmtjbY6XpGvRtt3ux17FUvXRhgp
         2okg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792419829; x=1793024629;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ynTwWaih3UWb7VmKOqAZKdwwEp9nTZ8YKOhE35tWuk0=;
        b=oATYSKlga7qKX8GhGZSPZnI7QobxhXX8yS5LQuwOfoUGogp1ddph/1+h1+u3OcB5ub
         OZ37tV4JnCpNC1c2x9ERpfI33fZu65SFs6W1n8ORTHnDL87oAv0QS7B85mWiZNAIadjU
         tp4CLomi+Q0Bsbgf9Bafu2TDewvCMNqOdMylWmqJv4DF5ozvO/XUAa/1NF/N+mlnO7JO
         fcMBn03AsCDe13jbTBkbNWjjSn5ApUg9pc5K9gBwTsbRQ9OCWHBIyb5/iGQ8JEu4tcyR
         ZlY1oCyfaxVv+m3Hac8hYQxrxMFL39wD4K8oRHcDHTVqRcl1EY/r5AY/Ke78QnUVixbp
         zgzw==
X-Forwarded-Encrypted: i=1; AKwUvBwBjPlKnfTMHY7U9egYY8cFuL7UeTUYyHLZPF1y/D4kIQbG1xP3QX17CSyhWUfQ6YBRXqYqGWGYIJcR2U4n2u8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYWA3eQ2Y1piR3I0QxP+hZP6hs/pEDChE7Lui4/u45yfeM9ZVS
	L8w3/P7Nmx4FJDxEZ7VEnWskMzlInfOHiU/J/E64oXwrTV/Ptz3d56XTBgGf7eWRUb0=
X-Gm-Gg: AYBFou3Sfvsm5OgXYYSJBcVgW4qmQMoyslmAc3S+VbLjjBkAt1mQqEjLVuVJjQGDwqB
	oObLz11dTgarJk9Rm9d+qZVlKOaIX0UmuE4IiR2u4ZpT1e/pKg1kVXNieJMHrxYJDIPQAAYK2uJ
	bsqF4cQ8P7Mcw4WO5yNpCljOvS/V50XCdwc4ZB50xpfEVCpNzz+CMu+wYNOBymUPEux+vv2rJOP
	wbwz5dw1e19OK2yff7nOTsFVKObGDCvajsxARYHW0HIKz6/RRf1VEDfhTOb/m7U0EqWZ5LmslJv
	xGaer+fh2FWch6nrJsxavpRrZElfIVdR36FQPdurG4ikxBIkCJxY7fsBpV28vOJ8ZH7I0Rf2kRP
	nnm/+hBGjap2zCIqoURmNn69EySagZI00jZs6IGC/qBF3ZnmJqmsgSMej7DOxowQ0hiXsH52FTE
	Jh5g+evGeEvfgf/jNcPRsMN+3xfeBrC1XiSO+oPHrpUV8z3vf4d5hZe2RWH1VZ47KeLluriDmSg
	QHLNXzf1+rIHpaGDYDXJo/uyIMixw2/uaS1hAODt8wlu7QPVzE0h+PFpSGoupyNDhAt2KFlIDM=
X-Received: by 2002:a05:6122:6d10:b0:5c9:c60e:3a48 with SMTP id 71dfb90a1353d-5eaaa941aebmr2358171e0c.20.1792419829096;
        Mon, 19 Oct 2026 07:23:49 -0700 (PDT)
Received: from google.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eabf0f70ffsm4885498e0c.16.2026.10.19.07.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:23:48 -0700 (PDT)
Date: Mon, 19 Oct 2026 10:23:47 -0400
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
	linux-kselftest@vger.kernel.org, kuba@kernel.org,
	enelsonmoore@gmail.com, bp@alien8.de, shuah@kernel.org,
	david@kernel.org, akpm@linux-foundation.org, linux-mm@kvack.org,
	ljs@kernel.org, mhocko@suse.com, skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org, vbabka@kernel.org,
	dapeng1.mi@linux.intel.com, linux-kernel@vger.kernel.org,
	corbet@lwn.net, surenb@google.com, kexec@lists.infradead.org,
	pratyush@kernel.org, rdunlap@infradead.org, elver@google.com,
	graf@amazon.com, lirongqing@baidu.com, liam@infradead.org,
	jlayton@kernel.org
Subject: Re: [PATCH v1 0/8] kho: add read-only Kexec Handover mode
Message-ID: <atYn87kYpuIhRxLP@google.com>
References: <20261019021111.990394-1-pasha.tatashin@soleen.com>
 <atXYMK5tmW8f23gs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atXYMK5tmW8f23gs@kernel.org>

On 10-19 11:43, Mike Rapoport wrote:
> Hi Pasha,
> 
> Some brief comments before digging in.
> 
> On Sun, Oct 18, 2026 at 10:11:03PM -0400, Pasha Tatashin wrote:
> > This series introduces a read-only Kexec Handover mode, enabled at boot
> > via 'kho_ro=<pa>' pointing to the physical address of the KHO FDT.
> > 
> > In standard KHO, the target kernel takes ownership of preserved memory
> > during early boot, initializes struct pages for preserved folios, and
> > reclaims KHO metadata and preserved pages back into the page allocator
> > as they are restored.
> > 
> > In some scenarios (such as a caretaker, inspection kernel, firmware), a
> > kernel needs to inspect and consume preserved KHO subtrees, radix trees,
> > and serialized metadata without taking ownership of or modifying the KHO
> > state, leaving the preserved KHO tree intact for a subsequent kernel.
> > In this mode, the KHO physical memory lies outside the kernel's direct
> > map.
> > 
> > To support this cleanly without duplicating KHO traversal logic:
> > - Patch 1 exposes the physical address of the outgoing KHO FDT via
> >   /sys/kernel/debug/kho/out/fdt_phys so userspace tooling can pass it
> >   to a 'kho_ro=<pa>' kernel.
> 
> We already pass the physical address, why adding a boolean kho_ro is not
> enough?

In standard KHO, we pass the physical address as part of the normal 
kexec_file_load() reboot path. In that flow, the outgoing kernel shuts 
down or serializes all devices into LUO state, releases machine control, 
and hands over all machine resources to the next kernel, which becomes the 
sole "Machine Owner" (MO) and owns all machine resources.

Here, we are using a model where a minimal "Linux Caretaker" (LC) kernel 
runs concurrently while the MO is still active. We spin off LC on 
dedicated CPUs that have been offlined from the MO scheduler, giving LC 
read-only access to KHO so it can temporarily take care of VM while MO 
undergoes a standard KHO-preserved kexec reboot (i.e. Live Update). Once 
the new MO kernel boots up, it takes back the resources from LC and 
retrieves everything normally from LUO/KHO.

LC is never the machine owner: it has no PCI support compiled in, does 
not handle device interrupts, cannot handle page faults, etc. It only 
exists as a temporary caretaker. LC is booted entirely inside a small 
LUO-preserved memfd area (in our use case, LC's RAM is only ~128MB, 
while the host machine has terabytes of memory). Because LC's direct map 
only covers its own tiny memory footprint (for isolation reasons, and to 
save on struct pages), the KHO FDT, radix tree, and preserved VM memory 
all reside outside of LC's direct map.

LC is configured and launched directly from userspace while MO is still 
running. Therefore, LC does not receive bootloader handoff data from an 
outgoing kernel, as MO is not even shutting down yet. Userspace 
therefore reads needs PA address of KHO FDT and explicitly passes 
'kho_ro=<pa>' on LC's kernel command line.

> 
> > - Patch 2 moves the shared radix-tree key encoding and indexing,
> >   vmalloc flag conversion, and FDT validation and subtree lookup helpers
> >   to kernel/liveupdate/kexec_handover_internal.h so they can be shared
> >   between standard and read-only KHO.
> > - Patch 3 hardens kho_restore_vmalloc() by introducing
> >   kho_vmalloc_validate() in kernel/liveupdate/kexec_handover_internal.h
> >   to validate the preservation metadata header and flags before
> >   restoring the vmalloc area.
> 
> The diff for kexec_handover_internal.h 
> 
> >  kernel/liveupdate/kexec_handover_internal.h   | 171 +++++++-
> 
> seems a wee too large. Maybe some of this should move to a .c file?

Agreed. I originally kept them in the header as static inlines because 
they are mostly small bit manipulations and helper routines without loops, 
but moving them into a dedicated kernel/liveupdate/kho_core.c is OK.

Also, for v2, I am planning to allow CONFIG_KEXEC_HANDOVER and 
CONFIG_KEXEC_HANDOVER_READONLY to co-exist in the same build instead of 
being mutually exclusive. That way we won't need two different kernels 
for vmtests. In that model, common KHO API will use function vectors 
dynamiclly decided at early boot depending on which mode is activated 
('kho=on' vs 'kho_ro=<pa>').

> > - Patch 4 avoids modifying ser->next and bs->head_pa in kho_block_add()
> >   and kho_block_set_shrink_one() when operating on an incoming block
> >   set, as the chain is already linked and incoming blocks must not be
> >   modified in KHO read-only mode.
> > - Patch 5 adds CONFIG_KEXEC_HANDOVER_READONLY and
> >   kernel/liveupdate/kexec_handover_ro.c. When booted with
> >   'kho_ro=<pa>', preserved KHO metadata is mapped read-only
> >   (PAGE_KERNEL_RO), with the FDT and radix-tree nodes mapped lazily on
> >   first visit and kept cached, providing read-only implementations of
> >   kho_retrieve_subtree(), kho_restore_vmalloc(),
> >   kho_ro_lookup_folio_order(), kho_ro_map_folio(), and kho_ro_unmap().
> 
> What are the expected users of these APIs?

The primary use case is achieving ultra-low disruption Live Update 
(<30ms VM blackout time) while running a minimal VMM inside the caretaker 
kernel. This VMM keeps VMs responsive by servicing software-only, fully 
virtualized devices that do not require host hardware interrupts or global 
machine state (such as virtio-console, pvpanic, virtio-rng, etc.).

Thanks,
Pasha
