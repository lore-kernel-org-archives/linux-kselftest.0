Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B898390CA9
	for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 13:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781702255; cv=pass; b=flrb7MvHErRqNtmCaxdGSmbOo588vGNV8Qgm8yot0RbEjGkvYqkF44dI4AZhU2k53Ltqpq1qatZmpUFJrJr/Zimq5pyz8g5RItvRJ91dzARCYay/MEts2PNkL3OlIQFz4dfunKOoNaVGFzbv2SvAjLwophi22h7jI177j2ggH5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781702255; c=relaxed/simple;
	bh=+CNdrODz+Hv1rDOvnESn6HIq5tpRJ8ga6baCyPTW/es=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aU/VyEJuc2caYZP88XoGgOH+PEMJWlOkd12Qk+GWAE20wFPmVlXxe/IlYbPfSlKCBSEGUiP+4113pQAzg99xi/Z6z7jcRtRy0eC18ooU1BgWf0mKFivrYaChvL9vA7ajl+G5Aw8V5UEXnDO0jAEF8RWFsNv975HNbiuJSaQUgQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T1pAK3KP; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T1pAK3KP"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-13986d61b4fso1923979c88.0
        for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 06:17:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781702254; cv=none;
        d=google.com; s=arc-20240605;
        b=ehVqPQ7NfxyOfkoVZckCk1Zmth4DlDL8ueqcx5wL2BQbOmZqWvEhEjFRNcQPCI8ncA
         nbR/TSXE9DE3gYEhXqdwsf/E/+GLDKcFn4Xt10sAMlbZVUz7XSsBHp/WRhfzddgFbD7j
         0q1SZf4V3Em7++qy1FCUiR4Fp+9LMZar0qY/BHvymhHnzU19CvO1OGQR4acxxivdGF98
         u2lEqG7/68fNXWah/52/xI0/gx6ySUuxc90X9fC0cOrPV0Qt2qTfBKVWLR2/AYshUIgV
         7M0rbVoDa/GTqKIr9mhcgcT+5PcLu319AX6f5SjTUMwGCaCfvjgnp0UEovlEUuJTAHq3
         5P4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=RwC8e8Lmq0O5HhDIZSANNcyMzpbq38LuCnVbAdWRbDE=;
        fh=eu4vcyiewnK8qRykgsck5jjXmVUNhqs9NAAFZmYGEtU=;
        b=GgvK+n91F8hoDyDEUDBhsSdzcJJYgsN5pDrclNUyJ5oKkGGlhVv6N8fKF841WcS8RN
         Msrx2cZkORXxxfYuTg8r8gGdaLCu83Ef43/fkPPG88KGVe+QvxmkpLxt+HTq1aOUOVgF
         V1NczTQVqvykv1xfVB2FYn0Cg4cJarFWOxdzXNI+oAlTc2EigplmXB8LNBjEiWjqbEkJ
         l3weHZjuXwdY2pC37/ot44N1/S/1VxlOeA+7kEW+N5GujRfTsisNSInFOoXzR5hGcPUz
         ET5XyUs887aGXlZfSZ6G9bHJKejUXQzTricrcXFxDMTtwTUHVQZynCR1ltYmyLKN3iPf
         +QpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781702254; x=1782307054; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RwC8e8Lmq0O5HhDIZSANNcyMzpbq38LuCnVbAdWRbDE=;
        b=T1pAK3KPGeMaojTaR7Q7CH0ryMMoPQw6zy9WKGoYhGMgxa1Sjk18+zZjM779P0F0x1
         h8QXDC8hawbGIVoJac5jOkcv7vLVIRQDoRbQay1cc6IPy5srosJLITy2+hRomBKh3JRT
         aa1+zGnZg87Brw/Hjj61sqyBSmiVL3gQB/siC6Gb+5nouccMf7gLMQa58425U6Pp36Om
         Mhei8Atq/qsePwCNqiFMq/TsrdYiheIO59WpTtYpYRDgcVI1BXhPKWKZ4H0x1I1OZjx4
         NctUPo0s1xo4UGC3NWx3N9AiIjnYS7K+sVnmlfd4hW17Zk8y4d95RyFSgV1nqP5FT8RF
         ahGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781702254; x=1782307054;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RwC8e8Lmq0O5HhDIZSANNcyMzpbq38LuCnVbAdWRbDE=;
        b=bor37+NAFWv6qGa/uKIMPKP07UeVI+Tc9OVL1QBQnD8948Ir/2YevRqlePCtjje+a8
         NNtXOf2QvBm3AcoUYSIWQx4XbqO6TY1C1gCzy5gITHSv/WGWWdnJuyDkH5O6KQd1L8ox
         dJTX2XSwZ0byixk0p9mbE47fpD8Dusmg8/bor2zy6tZ82+Khu6xmhv8S7ioOKwn7NHc5
         tCy4MgMl4QkTagExieWHNar8Yf2No4jf84nVYWiDmFhddM/TIMEPPtChcyLDgQiy/hqF
         SIatE3tL6gAAG0XvF01xFjR8csNF3V8ZazVEDIiTEvtn4EG65m5R0jXq1llWsE9lrqgY
         Cd2Q==
X-Forwarded-Encrypted: i=1; AFNElJ/Ja6UC4IV1jOxDCAapZmUqDp2frGuUyYIPliaOXtQj+zNAWlD/GOJ+8oKUv4wcZmuLU2huzJ0B4xezRLa18ec=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0zjzww7fuRGP0jRjXhy3EgGZyGPHlzHhpIorGytnNH8FnOFL1
	d5Lr4aUvCliEZY3YYOF79xdoB1NVmRAgL4+EwJ0RCNj9W3/a6C97iL25PNYqevilA//3kUwk1of
	aqC1Tp3xvO00cP69MVgO4YhnWKevhAWicBEF4XDMN
X-Gm-Gg: Acq92OEwSHSF6phcrrZbWc6pXqvKK2eu1d5ulJz4Z6EENYmyx9jbxaBcrAQOIVxBx0g
	X+7Jv+/oK2M/XzZaF0eAqjSZqLI6EK5vCJt+qnpvBlA3YGm/orx7yoRjph9HRxrTsO3vrpt3bYE
	MTEn/+ZvrAqONzbArvkXmmXHvICLEvhLUCzfg9jOV3NGLpK7+8Uh80uPvrZsB1CCMn0cYMANpEY
	unWrOluXsXy89s52ZMUVZuE+J7Wuv0U+dMQTAqE2o0SL+ACpaqnQ0ZXeItD8xWKcvOTV1NlRktm
	yFCYTW4zk8U/A/79xgyrNmn+ope0
X-Received: by 2002:a05:7023:b0a:b0:137:fac1:c062 with SMTP id
 a92af1059eb24-1398f666456mr1449795c88.7.1781702252499; Wed, 17 Jun 2026
 06:17:32 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 17 Jun 2026 06:17:31 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 17 Jun 2026 06:17:31 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260602-memory-failure-mf-delayed-fix-v4-3-a5bc7db5a9b2@google.com>
References: <20260602-memory-failure-mf-delayed-fix-v4-0-a5bc7db5a9b2@google.com>
 <20260602-memory-failure-mf-delayed-fix-v4-3-a5bc7db5a9b2@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 17 Jun 2026 06:17:31 -0700
X-Gm-Features: AVVi8Cdef2qXnvj8kjBvz8bXKzlY8rIYk_kwyzXVJwqQ7pJ9jLNjcBvloKBgS-0
Message-ID: <CAEvNRgE2iqYpEy8F4df2b=zegzqmJAgVJs5xz2KD-jxe+0GNMQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] mm: shmem: Update shmem handler to the MF_DELAYED definition
To: Lisa Wang <wyihan@google.com>, Miaohe Lin <linmiaohe@huawei.com>, 
	Naoya Horiguchi <nao.horiguchi@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: rientjes@google.com, seanjc@google.com, vannapurve@google.com, 
	michael.roth@amd.com, jiaqiyan@google.com, tabba@google.com, 
	dave.hansen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

Lisa Wang <wyihan@google.com> writes:

> To align with the definition of MF_DELAYED, update
> shmem_error_remove_folio() to return MF_DELAYED.
>
> shmem handles memory failures but defers the actual file truncation. The
> function's return value should therefore be MF_DELAYED to accurately
> reflect the state.
>
> Currently, this logical error does not cause a bug, because:
>
> - For shmem folios, folio->private is not set.
> - As a result, filemap_release_folio() is a no-op and returns true.
> - This, in turn, causes truncate_error_folio() to incorrectly return
>   MF_RECOVERED.
> - The caller then treats MF_RECOVERED as a success condition, masking the
>   issue.
>
> The previous patch relays MF_DELAYED to the caller of
> truncate_error_folio() before any logging, so returning MF_DELAYED from
> shmem_error_remove_folio() will retain the original behavior of not
> adding any logs.
>
> The return value of truncate_error_folio() is consumed in action_result(),
> which treats MF_DELAYED the same way as MF_RECOVERED, hence action_result()
> also returns the same thing after this change.
>

Thanks for explaining here!

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

> Signed-off-by: Lisa Wang <wyihan@google.com>
> ---
>  mm/shmem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
>
> [...snip...]
>
