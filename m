Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC6819E992
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Feb 2026 12:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771505040; cv=pass; b=a64tLBjxeFbfpmxLFTnnU5KnehZBuAh5x7nWMiN/SO7AkQIGuFaTSti88h5w+kv0ZQ2rswsfhIFCAxJQsZd96219/Msa9AVGPOhx81e6K2XNMbksgeK3bKhxhNlL7vJ9xTITsuAv4cDAYJ48zx3CPJo141uQQnAfYxO6P7348OI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771505040; c=relaxed/simple;
	bh=aes4AHs+AOWhWj2FYmgytAYSf1U9HD0Qri/K8EHmzMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SznnjMUodRYHhNuhVk2kQ86DSr/elOAKpo5xTVcotcqvOFJVP+f0tKYtNHPeyyzh5GJiRyidWnT+R/tb/Obtek6YEUEEcIBE1fGsEDbVVgZnKXLzrFGnB/Qg+DUwwuKsb8dBE0Skm3qZL0dz7c+Azulq+h5TpLcloLYZTVuS/DE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y2XdxYxl; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y2XdxYxl"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-505d3baf1a7so359851cf.1
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Feb 2026 04:43:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771505038; cv=none;
        d=google.com; s=arc-20240605;
        b=TUn9+1uszxtmNkWH8WiQhZ0un2mvBX4e66FlM+EpENifySwc4b8irHdxWot+l/uyRB
         rjQoORXDYmFNSFVnnguN4Ggz4UPs8woFAg+ZZ0dEFb/8jZLJihQwZOsekhYiLvyqmHAs
         gu297Re9cBUctnHBU6wlyb+uXcC01WUDECWYHlbpLgYkz9vjeHdHaiU4OdrukPEL9zUd
         5YN5t9Eu/pcFdwOR8788zPYOBPtVcGWW3j/w3qzUxT8TKr9RpRHzNP5GSHs4ji77Rbh4
         A0dnVHSgqcpI14G7EhGob1s6/CT+ibnwls0dmjPdFLvYRvQ0rOI/clzYVtO8ew01fma3
         k7gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=o9bs+Ht8G4EwUkix0oJqONw0G8EjLC3MyIbQ69wavOs=;
        fh=SgnOfYEw+gjiH9rAKsgxe6YWdT583lWl2AbAjYuy3qo=;
        b=XkjtY5BEUzKFzUSfhaJETfEk5tkc0pSWbQU6hnn6BRqlQTeeCntAZ/6YdIRUKmOWWb
         ZvF6dtxfyNNiafYDKvVDMNPpu8I+y+GCtUUxDJrZLh6P6QseXkmlZq5/RMn+rKwNEOMD
         4gbb2lJlCGj2CQca04ksDvQBvgfDL1S6E7pWdlKu488Tpa2mNTyK4p1OaZ0iDMy/bqsb
         gQkv8/K2CevCUZ1++POVqkjl5t+FHylOLQTmsnIvPKUdh+h5/9BwhJmNtr4r74KgiutW
         MrQhLCYtTbS0TX7hepJ2zRNPhWpwBRZh2vzHsp+9oj0SgBR3icGVYtai6wrJ+haaK0cs
         pdJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771505038; x=1772109838; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o9bs+Ht8G4EwUkix0oJqONw0G8EjLC3MyIbQ69wavOs=;
        b=y2XdxYxl5B3qEvIH/7EiyUej4zu02zEh9V+uDaCvJARejtyhqCZB8IMShpk9DVW4yg
         DTY+BbcwGWxPF5A4vAA3CZdXqDijVHjcjqmrzK45AiqlGN1BaKNePYguDXF6K9t/X9wI
         siW+NqVc+3yFrf5NvuIj3giYLezlvipPZWL53de5kU/mYRkiOEJX5yGiuvIUFAgjSrkJ
         DCYe77MNFT+sBHoglLREmJpBgpDHFrcfpTqkwuhBuUisth9R9C/dsWdbNnPB8QTh8+/B
         JAuqbx+v247CdBrVHzMIfB7U43HXT4ikfSJpeQ+wEzdYYmP7KAS5KmpLCz3Gc32hMh/q
         Fe9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771505038; x=1772109838;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9bs+Ht8G4EwUkix0oJqONw0G8EjLC3MyIbQ69wavOs=;
        b=NntyE3lZdEzJJQLwIPSMjDWEwMJPLexaW0I7Q1Yy7RjqJgru6ShYN5qvJ/WtJHY/Ev
         m2Y4pKHTJar3RAeOXoLSk7hseuHvtYxTsNseqdOexgqPTXHO50MJf/SmMnAfJaIjVBY8
         IYJtZIu97riaNDYqgBdX7mraN7PiFnkhAtQQovN4A7i1AkpG0G0lnqdL068TTseS93c5
         WbAjz5v9ohyaLGnwwkJMcxNUn7FhUQiFZE2tmdQNxXSSw3JcTgzi0+fnY5X2rnHFBR/m
         1K7c0/ZtT0/QOSCuKKmVrVpVPe+EkzYlCBIe9O4bCPrcPztMU6USrARzgxgd0ANO/EYS
         l4ig==
X-Forwarded-Encrypted: i=1; AJvYcCXUkVJ+fzfuA8cWT/aN62V1DB6JcQp23Plo0uTSuJOXW/VcElCNsN0GZnT1WecPKRyao1QfKulUDnzCCofYuS0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjp26OHBEwjMJEjBPmpqqSc5tIvNFuP2PG1OGRUwuN60m0dVsd
	wTk/tKf1R8oqpulIz0NRSoTL8pCPqOBACcyrg66/6wY5cq+MMCrsNtmPao6eXi6YhYV/FoRI2WX
	wHOCiOSXP2EnVfMbsGYlmBHeo0f7bX0NEmEIDKFHu
X-Gm-Gg: AZuq6aIJ9A/dBiUs7wFM121e6wgz05dRRTtLB/OLcI89+gW+0aetHPwWEL1HuRTSoHt
	SNAnuk/jUTM4jk4XpO7Rfdcxn33Br9mVN+BSQZzM/ZrOcDv8qWn4ylhQOYL1WakQ3SKOG5uRqOG
	0fJa+9LNCk9nzZtZPvq2ZP+G1++VynGWbD1iGOxDzvWUrHqIHvW31LBHE7jTpiDiSCfREkRr4rx
	9OJ5Q4ZbGVh9vy7NqRtcYEAnkXtrLFttXd/IOpmy+ha7tjVpAgBsJ96YYY8Icqzt1a7UAuMcZ4f
	OhucSRr+
X-Received: by 2002:ac8:7f0c:0:b0:501:4539:c81 with SMTP id
 d75a77b69052e-506f1dbd2e8mr6722271cf.2.1771505037357; Thu, 19 Feb 2026
 04:43:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1770071243.git.ackerleytng@google.com> <86ad28b767524e1e654b9c960e39ca8bfb24c114.1770071243.git.ackerleytng@google.com>
 <CAEvNRgFMNywpDRr+WeNsVj=MnsbhZp9H3j0QRDo_eOP+kGCNJw@mail.gmail.com>
In-Reply-To: <CAEvNRgFMNywpDRr+WeNsVj=MnsbhZp9H3j0QRDo_eOP+kGCNJw@mail.gmail.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 19 Feb 2026 12:43:20 +0000
X-Gm-Features: AaiRm52i2AVuoNuRooDCBFkBdqWWQyvSpL3Y8tHflFey7_du661FzMtD72y3RC4
Message-ID: <CA+EHjTwax_DW58a-hQ=TtsqbjTbBDBDeGvkL1fcDOnY4B-SjeQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 09/37] KVM: guest_memfd: Add support for KVM_SET_MEMORY_ATTRIBUTES2
To: Ackerley Tng <ackerleytng@google.com>
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, x86@kernel.org, aik@amd.com, 
	andrew.jones@linux.dev, binbin.wu@linux.intel.com, bp@alien8.de, 
	brauner@kernel.org, chao.p.peng@intel.com, chao.p.peng@linux.intel.com, 
	chenhuacai@kernel.org, corbet@lwn.net, dave.hansen@linux.intel.com, 
	david@kernel.org, hpa@zytor.com, ira.weiny@intel.com, jgg@nvidia.com, 
	jmattson@google.com, jroedel@suse.de, jthoughton@google.com, 
	maobibo@loongson.cn, mathieu.desnoyers@efficios.com, maz@kernel.org, 
	mhiramat@kernel.org, michael.roth@amd.com, mingo@redhat.com, 
	mlevitsk@redhat.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	pbonzini@redhat.com, prsampat@amd.com, qperret@google.com, 
	ricarkol@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	rostedt@goodmis.org, seanjc@google.com, shivankg@amd.com, shuah@kernel.org, 
	steven.price@arm.com, tglx@linutronix.de, vannapurve@google.com, 
	vbabka@suse.cz, willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com
Content-Type: text/plain; charset="UTF-8"

Hi Ackerley,

Sorry, but I completely missed this!

[...snip...]

> 4. guest_memfd ioctl flag
>    SET_MEMORY_ATTRIBUTES2_FLAG_PRESERVE_CONTENTS. -EINVAL if kernel and
>    vendor don't support content preservation
>
> Specifying a flag to choose whether content should be preserved at
> conversion-time is the current best suggestion.
>
> What does the rest of the community think of a conversion ioctl flag to
> choose whether to preserve memory contents on conversion?
>
> Fuad, I think you also made a related comment on an earlier internal
> version we were working on. What do you/pKVM think?

Introducing PRESERVE_CONTENTS seems like the correct architectural
approach to me. pKVM fully supports requiring the PRESERVE_CONTENTS
flag on every conversion where data retention is expected. As you
know, pKVM operates at EL2 with control over Stage-2 page tables, so
we intrinsically support in-place state transitions. Requiring the VMM
to explicitly pass this flag when injecting payloads ensures we have
explicit userspace intent without artificially restricting pKVM's
capabilities.

If userspace omits the PRESERVE_CONTENTS flag, KVM must zero the page
contents in software and proceed. Returning -EINVAL would be incorrect
because it would make the flag mandatory, eliminating userspace's
ability to request clean-slate, destructive conversions when needed.
Additionally, software zeroing ensures deterministic behavior across
pKVM, TDX, and SNP. The guest is guaranteed a clean page, isolating
the KVM uAPI from micro-architectural data destruction nuances.

Cheers,
/fuad
