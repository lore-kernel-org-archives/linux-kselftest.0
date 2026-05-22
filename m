Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A520D3655D5
	for <linux-kselftest@vger.kernel.org>; Fri, 22 May 2026 21:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779486356; cv=pass; b=J+Cr5FvfkpeIBtbYk+R+Csw6jk7qyPS+vJE4j1Muz1UhLvqarlC8ik9L1JYMLiBwV6gzSgkmosJ+ByfwsHA54WaXZRWVTIUa7SQ9pgS+bqV0zzHMN1csx5z+Nu1O3RWlT2uM+AGjKGic7JTkWZGfauSOyM6dHCs0LeRFBLuT1wg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779486356; c=relaxed/simple;
	bh=yeXSyELI1E2yiYIHqqHrMC7NqZzRTFrVfjXKk8f/rzo=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qdO8jON4ieH9LTi4gofcj5mrWwdZ/HUPfZFKdc+9E/8FsXzdiu6OCQWL7JDJ7RTKm/J5GeUcMOWzNwb3HaRBea/uWyD/ZIBcb5xrUdjHAvtXbxplNaPoX3vNw7iNyP46ckdmHKoAWEmqGAfE2liNuCM9U35i/1mBZ7QjwrvC2tg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RrAiuOtq; arc=pass smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RrAiuOtq"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-6312a0d556cso3634260137.3
        for <linux-kselftest@vger.kernel.org>; Fri, 22 May 2026 14:45:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779486353; cv=none;
        d=google.com; s=arc-20240605;
        b=JlNJWc4zmStHRh2bPOujB4y1x4YemrSszD6/vwDDs7ItSgY6QZxxavTnWVN2wX0MDB
         X92v8ez79GCI4cUe7lzb+yr2O40nFd71X4wwAKZDJ3FnW3eR8bew/nogX6DqgrbfdsOT
         F7I1UvuJe/jvi3+fvFTkooAh3IMNnx5FX+UN7zdz5iKzgR03SpwW1ihItjvhqxqZ8cLh
         HmtlhguFvD7gGPGSgjZKQhkyEEBMA3wqFqSqIPIkddpGjYi7g2pjqVbLqzJ2tn5Rob4v
         CmhB92hnr2Md45XiKPZ1wdDpmqie6F6PFQRdV9PZrXYjaIvf1Q9UYQQG6i25fIrwYhku
         mxfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=HF/NjXSXWmsZ2MTdon58/xGzT4WCBzILiqAAQFlOD1k=;
        fh=0YWtL/vCIotYy8vFNJ1qiMt+lfLqVF92+XrLkgKca9A=;
        b=gQxNQkovC+WJA+PRuCrwzQ+oIh1CONAbEyuDmXK6lEgVIjRQbvvhXtBfHd0DRYg1Xz
         O84TdewIQQfN/FAt4y8HP7zg5+EhHOCBLo1Rmcxe/iT4UexqauRhp6AL/3Dg2cVpZtI+
         8OJNQOUcpD91uGDnG/xWkFZRZCC+MqfP4BDTV6WzPKIWvqokgCf+HxiCT9o1jwBYR4Fj
         ExU8HwfHxjSzBoy70f3W0qC0L47kqyIIc43jgXwcsKtDIeJUJqGu1bHihFMIDFBXnu36
         AdO5EcLHs8ZenCl+pMERwZ6z+jzg7urIgjGFqAUywbIeNEul/87mR9LHEy9gpP/CAboY
         hpsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779486353; x=1780091153; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HF/NjXSXWmsZ2MTdon58/xGzT4WCBzILiqAAQFlOD1k=;
        b=RrAiuOtqBcUqVZiRfph8W6B1cp6RwD4bLszq0B+KL/5CDkhs50X+q+b6/IeuOhYEi0
         7A1cexEvgfOT4NE5bpUHLqTUdnacaFMctWqkINpMx72OlqZQedIFbRT6XffoRYH35ORn
         8drIzuNRFAI1vZVgobXbhY23GshQb4c3HK2zKv+I7jU/T2uLUNIidUzxSyIebSytyGOV
         K0qfncmYSEfdypSK51lpTKuYNMowqTbl9eSqfx0pjru0Zj/f8mQXZXHRxh7KUsz2EtbA
         G6PHgaOYLzbWIFXIye4VlF55w4qXCUsC3kED7AfpnrfpEMT4fgDu9lb8UsJvKiJka29N
         gybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779486353; x=1780091153;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HF/NjXSXWmsZ2MTdon58/xGzT4WCBzILiqAAQFlOD1k=;
        b=RE3FcBZ1al7I6qWiSfZYCdLWTJH15hZD7eCizDNCHYXKXGSZd0S+hGRA7Qal6dxvpU
         O9UNQHId/aZTx3Es5+zTD521Q7pJtUQOZpOnCYx0pStaV2x04G8irsA+hagGoxC+Y/1t
         XUvFYzS/udhPTq0AQlh9q8ooahbWbgkstLIuUdwsCwVJmOg8TOwoW+FkEZwqrtrTrWyi
         TJVDJqqoMLk4TxpkfC+vO6N7isavItUnYyFX84lfI9pUr25oWCVF3V11L6qHm9OMYuVU
         3sm2ep4tv51XANkLuNboveIhgpmYS8ql6/SUUyMyKRykae8k4sKcO/SOR3qzHQd+Dvy7
         ppAw==
X-Forwarded-Encrypted: i=1; AFNElJ/TIXscwL1eWZ9v2FKbETWBHjx9YiYqlJVudSTgLTp6fLmdhR6//No0eEoPEe2f286aniKpHuQC27xtCBYylQk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/NV3jiEH8ViYHrfzXY0gylhf5H50+vgLoXw6RZmXjpc5sY5sU
	jtWNOHpwxNJQ7iMBVo2xI266V26+ey2GD6/KPPpR2vTzxUnxokg3JxioiIyVGV5WUMLbrbEjYnZ
	20PeLFsXbby/vgfWRuRdlQofnkswA3PV5858n4EkH
X-Gm-Gg: Acq92OFHO3qHYraKqoh5DagOfO6TiLzraizZN3NCk+xGTGFWnSRuiabXmUljpFyOojI
	7mEJDNgC1CC3XWoFKqIQ/OfMWEnlA73fw33WCQiF+ukTh8ev3xAveCWCokZFE0lYGiY6IyCkJ1+
	jIX5avYrYqNahJ02CUXzD3kKs3Z/pwKjf11nLibhiBK3SQukY+psCjBN3WZDCn5q6oBuZ62aalo
	nBFeHf6qt2yzXhmMTbY6o4dY4BH1nWuMZZQ4Wqd2q1Tw/qY9XNCZC1r3FjAw74DP6eo2oRfIoXj
	kIjWNz+4tWDD3i06s/JpBhtjAoj73f4SzLw3wAYKDW+ERiz85IC+xC+uiHoNJg6F6/4yQmALbR5
	SEXUS
X-Received: by 2002:a05:6102:3e28:b0:62d:b0b2:88b1 with SMTP id
 ada2fe7eead31-67c7405ef67mr3506832137.4.1779486353069; Fri, 22 May 2026
 14:45:53 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 22 May 2026 14:45:52 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 22 May 2026 14:45:52 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-1-91ab5a8b19a4@google.com>
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-1-91ab5a8b19a4@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 22 May 2026 14:45:52 -0700
X-Gm-Features: AVHnY4JHUcmHMeS0I0OECBQE9WDOiwFNaDvy5ucV_o_GqQwFVlnoZJcBRTb3Ibk
Message-ID: <CAEvNRgEjogBVDRNs2KmA--u9vHY1Jex-ERUuvK5idUrfoUBmmQ@mail.gmail.com>
Subject: Re: [PATCH v6 01/43] KVM: guest_memfd: Introduce per-gmem attributes,
 use to guard user mappings
To: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>, aik@amd.com, 
	andrew.jones@linux.dev, binbin.wu@linux.intel.com, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, david@kernel.org, ira.weiny@intel.com, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
writes:

>
> [...snip...]
>
> +static int kvm_gmem_init_inode(struct inode *inode, loff_t size, u64 flags)
> +{
>
> [...snip...]
>
> +	filemap_invalidate_lock(inode->i_mapping);
> +	r = mas_store_gfp(&mas, xa_mk_value(attrs), GFP_KERNEL);

Sashiko says using GFP_KERNEL with this attributes maple_tree could
allow a process creating a very fragmented maple tree to consume lots of
memory not charged to some memcg and proposed using GFP_KERNEL_ACCOUNT.

The problem with using GFP_KERNEL_ACCOUNT is that the maple tree nodes
are allocated from a shared kmem_cache maple_node_cache. Allocating the
maple tree nodes using GFP_KERNEL_ACCOUNT would mean that the node could
be reused by other maple trees unrelated to this process, and so the
nodes might long outlive the process using this guest_memfd, keeping the
memcg alive far longer than the VM.

For now I think it's okay to stick with GFP_KERNEL? Does anyone else
have suggestions on how to solve this?

> +	filemap_invalidate_unlock(inode->i_mapping);
> +
> +	return r;
> +}
>
> [...snip...]
>
