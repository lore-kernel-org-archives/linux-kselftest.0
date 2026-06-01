Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40B73ACF1C
	for <linux-kselftest@vger.kernel.org>; Mon,  1 Jun 2026 13:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780321856; cv=none; b=TuJETLsPsxoMOEA0BsPTznayBT5xqH5US4Okj3EoFx4s69PT/MoCoNZ7iol9NQ00G/nFWnwf1LuCmpxofZCMYIF/fGMS//WN142z4I/gRYsLnIoz3KP2XC6BnomLmfQbyCkyRv2Gm8WwehPDQoS7reCXsmGdjm3M0uVtU21jW+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780321856; c=relaxed/simple;
	bh=/E/bg5O5/rtFeBhPTthdDtYNhiYftMz88YnMxiS2Rok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M7Edy6/O73KhbHg9Ou22MvWIDSRTtYWyA5C6XEnP4Z03MtRWDL6LnWX0yRDBCCWP+IHdqVq6tZeY/oQF30hfpXHmnaEm3DaAaYNkuQhUw+8sUv237ZZUlv14nMOJPt8NyzGSUZHPC7zMx6r2sxqdtidPJlkc0zRXm+qv8fsXzEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=LM62a1Ex; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="LM62a1Ex"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7e2cb01a974so15779777b3.1
        for <linux-kselftest@vger.kernel.org>; Mon, 01 Jun 2026 06:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780321852; x=1780926652; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BfP3m3uDINOt0fM7mrJg3TEw4eDdUgfRDLxACEeD8dU=;
        b=LM62a1ExqHspsnBg7Gd+0LT+qwJvWCMx+yjllCvGBl2LY5+7d3uk6huplo4r4F8Dz4
         XXptJJIHcSlIy3/c00avz2g6X0nOlXGU2rXhE+daHW6eJk0QsYekpWAG7j20JhQmsf/Y
         gILXMZQttv+PnkC10zPoF9xUiWDin1cmhX0mc6ylQ3YgXdyrfNcntiHqMM536m2EWMr5
         9dZwnFHMXVnFXib+GbnPO6P75MaUd6Q0/Cc1tArFeSt98bzXyyviVwDHE09U4KcnQZ9z
         nsj9rYGFqlxl+2h2s2picrZ13Ko6EM32oPFVXVeL1G9VJTZ1nil37dfc8Q+i8CjZy857
         Br+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780321852; x=1780926652;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BfP3m3uDINOt0fM7mrJg3TEw4eDdUgfRDLxACEeD8dU=;
        b=VEzsTwdP3azsD28msulVrDRU9+Ct0TMKEesto6RGSOWk7tn34TJdrADSVxs8wMOeWv
         Ihs2UNF65txRc3kun9wiKg81iVoztt3yRjbAY+o2xMIwh6qbqWF+0t7QeC7MEhrzuHjo
         9MGfsHc0DhBnQjB6wGHSRsZxkXRLe6Jdbx/TS+JiK68Ebx5x7b39J8WpZ/dW1RjklCif
         7UUPpCe5STl51Py6qG1YozxuU7xunshgpl0uPgXx2jS7kad2dPRDURpiwfReY+fUgh4+
         RYoaPZgVAzorvr72gBDMQOfHIdTDsqTMYrwD8fjFVyqzwivvPH9Qqv7G5GNpy+o10Id3
         h+Qg==
X-Forwarded-Encrypted: i=1; AFNElJ+Y4mlQZTbwS551Iio1YP5dY8NdjeqG8F+muiAP1rkv/5sN5tRWDNb3GUkqDvRQRPl4qxxtmYCxaos1r26BRBk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8QrhfsVdKWtYTcOHt1IumGLTF7ZPF+m1dmy9mmXltBe0RGooO
	wfXNgyMlCJrdnFLCtm7KVxehdtHzRkf0xdd0cBxRQeSo8ds53FlXGenFv2FRs9k5xv8=
X-Gm-Gg: Acq92OFKQ+FDtr6ZQaOSfzm/2mUASXJVc3K9gss/eXjiS4/C3VnnCwXegzoRWBC4W/K
	GOyUWUNjHqUTyzr31mpSiPDzIoj6TF7YmR5rl6iOZTs7a6SbGc1TCmq1uZEVrYnwX9RNZjHzI2l
	3DYAcwNMplJL/2MLFP97UvvtbFJfpRWiX7qhaWP6TtYP5Qgi5yVfMW3wQqHgrCJLPDrBgL+S+68
	H+VaaSyZkzDVTjrTxRkz555XzjBXHRFzKd/vL68iV8Ch4p85Ayj3GvoUlyLyuQHAScFnkkUP72a
	8ul+DRGxHNuGR5c2yTmX0Fw9esammrlGfX4wzh8wof44kDOfW8wmkv5N7fXjLvj5ZcVUqt6n8Kv
	KXGRJvg42gH9odMcXbTIn24eHnA4bR+YFRxoYK/PJc0B5zYQ2bWllllbM7TRMla9oYoNaj03arp
	3Xi8JhWROFrW512x3E2i/63Irh6nM3EHrPUWll5+CkS9K4wsNrBjdjVWjRZ68aQDgV5c2D8jnIu
	HtnmRwd/umRHfzF/XhzWvlhhPU4aU8PkDuWBScY3Ho=
X-Received: by 2002:a05:690c:6311:b0:7b9:39f:62c8 with SMTP id 00721157ae682-7e05d8ceaeemr99332547b3.27.1780321851614;
        Mon, 01 Jun 2026 06:50:51 -0700 (PDT)
Received: from google.com (138.200.150.34.bc.googleusercontent.com. [34.150.200.138])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7e17be07a17sm39858607b3.34.2026.06.01.06.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 06:50:50 -0700 (PDT)
Date: Mon, 1 Jun 2026 09:50:49 -0400
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	linux-kselftest@vger.kernel.org, rppt@kernel.org, shuah@kernel.org, akpm@linux-foundation.org, 
	linux-mm@kvack.org, skhan@linuxfoundation.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, corbet@lwn.net, dmatlack@google.com, kexec@lists.infradead.org, 
	skhawaja@google.com, graf@amazon.com
Subject: Re: [PATCH v4 04/13] liveupdate: register luo_ser as KHO subtree
Message-ID: <ah2IuC1Z1ssIquXZ@google.com>
References: <20260530221938.115978-1-pasha.tatashin@soleen.com>
 <20260530221938.115978-5-pasha.tatashin@soleen.com>
 <2vxzv7c2fn8n.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2vxzv7c2fn8n.fsf@kernel.org>

On 06-01 14:39, Pratyush Yadav wrote:
> On Sat, May 30 2026, Pasha Tatashin wrote:
> 
> > Entirely remove the LUO FDT wrapper since the FDT only carries the
> > compatible string and the pointer to the centralized struct luo_ser.
> > Instead, register the struct luo_ser via the KHO raw subtree
> > API, placing the compatibility string inside the structure itself.
> >
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > ---
> >  include/linux/kho/abi/luo.h  | 57 +++++++++---------------
> >  kernel/liveupdate/luo_core.c | 85 +++++++++++-------------------------
> >  2 files changed, 46 insertions(+), 96 deletions(-)
> >
> > diff --git a/include/linux/kho/abi/luo.h b/include/linux/kho/abi/luo.h
> > index 1b2f865a771a..9a4fe491812b 100644
> > --- a/include/linux/kho/abi/luo.h
> > +++ b/include/linux/kho/abi/luo.h
> > @@ -10,11 +10,11 @@
> >   *
> >   * Live Update Orchestrator uses the stable Application Binary Interface
> >   * defined below to pass state from a pre-update kernel to a post-update
> > - * kernel. The ABI is built upon the Kexec HandOver framework and uses a
> > - * Flattened Device Tree to describe the preserved data.
> > + * kernel. The ABI is built upon the Kexec HandOver framework and registers
> > + * the central `struct luo_ser` via the KHO raw subtree API.
> >   *
> > - * This interface is a contract. Any modification to the FDT structure, node
> > - * properties, compatible strings, or the layout of the `__packed` serialization
> > + * This interface is a contract. Any modification to the structure fields,
> > + * compatible strings, or the layout of the `__packed` serialization
> >   * structures defined here constitutes a breaking change. Such changes require
> >   * incrementing the version number in the relevant `_COMPATIBLE` string to
> >   * prevent a new kernel from misinterpreting data from an old kernel.
> > @@ -23,31 +23,15 @@
> >   * however, backward/forward compatibility is only guaranteed for kernels
> >   * supporting the same ABI version.
> >   *
> > - * FDT Structure Overview:
> > + * KHO Structure Overview:
> >   *   The entire LUO state is encapsulated within a single KHO entry named "LUO".
> > - *   This entry contains an FDT with the following layout:
> > - *
> > - *   .. code-block:: none
> > - *
> > - *     / {
> > - *         compatible = "luo-v2";
> > - *         luo-abi-header = <phys_addr_of_luo_ser>;
> > - *     };
> > - *
> > - * Main LUO Node (/):
> > - *
> > - *   - compatible: "luo-v2"
> > - *     Identifies the overall LUO ABI version.
> > - *   - luo-abi-header: u64
> > - *     The physical address of `struct luo_ser`.
> > + *   This entry contains the `struct luo_ser` structure.
> >   *
> >   * Serialization Structures:
> > - *   The FDT properties point to memory regions containing arrays of simple,
> > - *   `__packed` structures. These structures contain the actual preserved state.
> > - *
> >   *   - struct luo_ser:
> >   *     The central ABI structure that contains the overall state of the LUO.
> > - *     It includes the liveupdate-number and pointers to sessions and FLBs.
> > + *     It includes the compatibility string, the liveupdate-number, and pointers
> > + *     to sessions and FLBs.
> >   *
> >   *   - struct luo_session_header_ser:
> >   *     Header for the session array. Contains the total page count of the
> > @@ -78,26 +62,27 @@
> >  #ifndef _LINUX_KHO_ABI_LUO_H
> >  #define _LINUX_KHO_ABI_LUO_H
> >  
> > +#include <linux/align.h>
> >  #include <uapi/linux/liveupdate.h>
> >  
> >  /*
> > - * The LUO FDT hooks all LUO state for sessions, fds, etc.
> > + * The LUO state is registered under this KHO entry name.
> >   */
> > -#define LUO_FDT_SIZE		PAGE_SIZE
> > -#define LUO_FDT_KHO_ENTRY_NAME	"LUO"
> > -#define LUO_FDT_COMPATIBLE	"luo-v2"
> > -#define LUO_FDT_ABI_HEADER	"luo-abi-header"
> > +#define LUO_KHO_ENTRY_NAME	"LUO"
> > +#define LUO_ABI_COMPATIBLE	"luo-v3"
> > +#define LUO_ABI_COMPAT_LEN	ALIGN(sizeof(LUO_ABI_COMPATIBLE), 8)
> 
> The length of the compatible field will change depending on the length
> of the string. While that is technically fine since a new ABI version is
> allowed to change the layout, it feels odd. I think it would be better
> if we define a static size here, say 64 bytes. This way you can avoid
> all the weirdness that can happen when you move from one version to
> another.

This is what I used initially, but we have cases where one LUO/KHO 
subsystem depends on another. For example, the LUO version must change 
when the block version changes, making the static length too 
restrictive. I would prefer to use proper strncmp() everywhere and allow 
the version string to change dynamically between kernels, while still 
allowing something like this (from [PATCH v4 09/13] liveupdate: Remove 
limit on the number of sessions):

#define LUO_COMPAT_BASE		"luo-v3"
#define LUO_ABI_COMPATIBLE	LUO_COMPAT_BASE "-" 
KHO_BLOCK_ABI_COMPATIBLE

In the future, we may extend this further as we add more dependencies, 
such as your preservable xarray, vmalloc, etc. Everything that depends 
on an external version should include that in its compatibility string.

> 
> >  
> >  /**
> >   * struct luo_ser - Centralized LUO ABI header.
> > + * @compatible:     Compatibility string identifying the LUO ABI version.
> >   * @liveupdate_num: A counter tracking the number of successful live updates.
> >   * @sessions_pa:    Physical address of the first session block header.
> >   * @flbs_pa:        Physical address of the FLB header.
> >   *
> > - * This structure is the root of all preserved LUO state. It is pointed to by
> > - * the "luo-abi-header" property in the LUO FDT.
> > + * This structure is the root of all preserved LUO state.
> >   */
> >  struct luo_ser {
> > +	char compatible[LUO_ABI_COMPAT_LEN];
> >  	u64 liveupdate_num;
> >  	u64 sessions_pa;
> >  	u64 flbs_pa;
> [...]
> > @@ -94,40 +91,29 @@ static int __init luo_early_startup(void)
> >  		return 0;
> >  	}
> >  
> > -	/* Retrieve LUO subtree, and verify its format. */
> > -	err = kho_retrieve_subtree(LUO_FDT_KHO_ENTRY_NAME, &fdt_phys, NULL);
> > +	/* Retrieve LUO state from KHO. */
> > +	err = kho_retrieve_subtree(LUO_KHO_ENTRY_NAME, &luo_ser_phys, &len);
> >  	if (err) {
> >  		if (err != -ENOENT) {
> > -			pr_err("failed to retrieve FDT '%s' from KHO: %pe\n",
> > -			       LUO_FDT_KHO_ENTRY_NAME, ERR_PTR(err));
> > +			pr_err("failed to retrieve LUO state '%s' from KHO: %pe\n",
> > +			       LUO_KHO_ENTRY_NAME, ERR_PTR(err));
> >  			return err;
> >  		}
> >  
> >  		return 0;
> >  	}
> >  
> > -	luo_global.fdt_in = phys_to_virt(fdt_phys);
> > -	err = fdt_node_check_compatible(luo_global.fdt_in, 0,
> > -					LUO_FDT_COMPATIBLE);
> > -	if (err) {
> > -		pr_err("FDT '%s' is incompatible with '%s' [%d]\n",
> > -		       LUO_FDT_KHO_ENTRY_NAME, LUO_FDT_COMPATIBLE, err);
> > -
> > +	if (len < sizeof(*luo_ser)) {
> 
> len != sizeof(*luo_ser) here?

I can change this, but it is not necessary. It is common practice to 
verify that a "struct" is not smaller when compatibility is checked, 
allowing for future expansion without breaking compatibility with older 
kernels. I know we do not support forward/backward compatibility in any 
way right now, but I do not think it hurts to put the proper safeguards 
in place.

Pasha

> 
> > +		pr_err("LUO state is too small (%zu < %zu)\n", len, sizeof(*luo_ser));
> >  		return -EINVAL;
> >  	}
> >  
> > -	header_size = 0;
> > -	ptr = fdt_getprop(luo_global.fdt_in, 0, LUO_FDT_ABI_HEADER, &header_size);
> > -	if (!ptr || header_size != sizeof(u64)) {
> > -		pr_err("Unable to get ABI header '%s' [%d]\n",
> > -		       LUO_FDT_ABI_HEADER, header_size);
> > -
> > +	luo_ser = phys_to_virt(luo_ser_phys);
> > +	if (strncmp(luo_ser->compatible, LUO_ABI_COMPATIBLE, LUO_ABI_COMPAT_LEN)) {
> > +		pr_err("LUO state is incompatible with '%s'\n", LUO_ABI_COMPATIBLE);
> >  		return -EINVAL;
> >  	}
> >  
> > -	luo_ser_pa = get_unaligned((u64 *)ptr);
> > -	luo_ser = phys_to_virt(luo_ser_pa);
> > -
> >  	luo_global.liveupdate_num = luo_ser->liveupdate_num;
> >  	pr_info("Retrieved live update data, liveupdate number: %lld\n",
> >  		luo_global.liveupdate_num);
> [...]
> 
> -- 
> Regards,
> Pratyush Yadav
