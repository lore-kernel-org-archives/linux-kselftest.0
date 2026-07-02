Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE04936308F
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Jul 2026 18:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783016247; cv=none; b=pRK9bT9w0zCvKQ2BpdCTDLVIVVvS3O07/P0nXsmwsawOt4t/casyzE6dTRzW5u6wESEspZP6ZCs1hpHXrT1kiM3SpsbmRR9k3du0iCT+5apay+SkgkJpm/Fc78Zs4b/dbc8M36tQBVXNf8Is1ptdVItULXPiKvHdMefwHtM5a3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783016247; c=relaxed/simple;
	bh=w3OVr9Po2XdUECAx2SJxsEXHuwRR+XanFttuesd63UE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y4XyIokdd0cKsLj+n+zmMg+VtvoIG7stJF2oDvc9RcZWhEPpHVgk/3YLWG8suUPc8Rubv23JxbbsHfzxtma8KbqDOE5JoI2qPDi53Fa98sU6fdMxT1m8HSU7kZ+OfbeRnvxFfmGlZVQCw6cU/fDeZUlTwA3hWtqd0UBOr+r6cLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=WiujR1wL; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="WiujR1wL"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-92e50979c71so209388085a.3
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Jul 2026 11:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783016245; x=1783621045; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BkwYUHUs3DSbCk8wCkm9DtFHy390UnK0AksZfeOtqa0=;
        b=WiujR1wLkqEhfeDc5P6P5NOKSwqcWPsYhoBVvekhwCQ2RwfmrFbmuPEotj4PQ6dkG8
         E/WeJb5FRxNo5mubxpgZz4IVP4KynnZTqHcNV/USky7VztxP9q8EsYzOoGfRjab888vy
         oN1kPpphMSk+qFT1Eyw2KhFgtMl0aAtmFz5fqgaAukjQhTqHdcZzbwiAmWPsa98TetZL
         uS+0voJqiuk0F6WRyrCREr1gVgWoGoBL7M4cMvukwMHiBxjwR4J8UvJArplv+NOtadPj
         0W25ZT911X6q6fTPuqPDFl75WG8XyC5P09EJa5zJIscZDTAfquN+vwQhgPsgFS7A7mNv
         mz8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783016245; x=1783621045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BkwYUHUs3DSbCk8wCkm9DtFHy390UnK0AksZfeOtqa0=;
        b=HVAv+dqQW+eNsB47MkWBIygp7+gJ8iFHOXnXiluaFWd+cEg5rZIr7bneiUXRq9VYRU
         U3nec0aLUxxy3uiAcDKvZ+aO1WSCwHgqbJulKdmySbswlFt4iUy+vKkAzuzTZhPrrRnV
         DcUIwE4GI1l8/m5geIko35MF89QqlorhX3VTDNo8xKMgFQFeIp/ybJ2bssLPUmCIK0gA
         cayahflXUrm5yNso86bJZvr2EvHTT09vzpiB35i2uXryMcTPxKpfOLH5X0vY39OPHgwu
         RsE9JHAheu4YHOUpxbs2XrtbQuWtdGW1TSOkskarkah0sHc3zd7e7PYxV2OeytEO5T9Z
         hCjw==
X-Forwarded-Encrypted: i=1; AFNElJ/p5AQTyCLfSOiiw2jPzfXVVTjyk8ZOrfMClOPo346vn9IWOYctJTNwsZr0Nv4HHwikXGFl/iwx4ewYLlsT+XA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQD24ry+nMLpc0MT7WRnfiyW62dFHZ5Iy9qf8jTuotPH8+JjF4
	nIlNiWUPTQU06CU9QAbZKGUDabg0u/AsQRpqMBzp9mQksPFblUxtSzliXP1ii5r9YAw=
X-Gm-Gg: AfdE7cm1zfpqO1td3+7JyihtN4kdxl1VAZUl7PqkKKeDXq7ZABy6FljLg7lvEum0Cvt
	wn5rKdaI8e8L9vy36BKKX6U78sLb0Mv0LmWm7hxBRhQyWcH7tL8woioIv/3jwinxlvcYSZA0YIx
	9J3r4cmsS0u8Db0SwH98xvF2b/rmhT4pOF6Us2gEARFZ401v2YPt0tJtqCgZuObIAAgBgrk8I16
	z/0ysl1NJO0us/fT5jFvAlGONy7pHS4jrGyvdm8mNH9leZDlvR4azRk2ch/PcsJkbaRU1u/k4Mm
	969GZ8NI2Zo5LJaFLpCH46E4Hkffeh5WBk3CMMzUduk9KSkZBaefpJNZ+/2JRZa6XWenLZh834d
	VZPcq2Uy2FsXOzsScwBO6EwiZlIOSzw06dyustKapWM8Pup/6bllj7HkzY6BiQc+gT2OwPx93I8
	rYuGgidzzjTXIHXEcJqlgEJh+u6K0meqUJR4T5o+hXOFtHKWn0I3sgABUYIc4Hq6ho7UM=
X-Received: by 2002:a05:620a:bca:b0:92b:6805:918a with SMTP id af79cd13be357-92e7851c58amr1082989385a.66.1783016244610;
        Thu, 02 Jul 2026 11:17:24 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f4722ca4c6sm32096536d6.39.2026.07.02.11.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:17:24 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wfLyV-00000006QKg-1pc8;
	Thu, 02 Jul 2026 15:17:23 -0300
Date: Thu, 2 Jul 2026 15:17:23 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org, david@kernel.org,
	corbet@lwn.net, leon@kernel.org, ljs@kernel.org, mhocko@suse.com,
	rppt@kernel.org, shuah@kernel.org, skhan@linuxfoundation.org,
	surenb@google.com, vbabka@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v5 2/3] mm/hmm: add hmm_range_fault_unlockable() for mmap
 lock-drop support
Message-ID: <20260702181723.GV7525@ziepe.ca>
References: <178301344866.373695.16044452017467686329.stgit@skinsburskii>
 <178301356964.373695.14274584821659522979.stgit@skinsburskii>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178301356964.373695.14274584821659522979.stgit@skinsburskii>

On Thu, Jul 02, 2026 at 10:32:49AM -0700, Stanislav Kinsburskii wrote:

> + int driver_populate_range_unlockable(...)
> + {
> +      struct hmm_range range;
> +      int locked;
> +      ...
> +
> +      range.notifier = &interval_sub;
> +      range.start = ...;
> +      range.end = ...;
> +      range.hmm_pfns = ...;
> +
> +      if (!mmget_not_zero(interval_sub.mm))
> +          return -EFAULT;
> +
> + again:
> +      range.notifier_seq = mmu_interval_read_begin(&interval_sub);
> +      locked = 1;
> +      mmap_read_lock(mm);
> +      ret = hmm_range_fault_unlockable(&range, &locked);
> +      if (locked)
> +          mmap_read_unlock(mm);
> +      if (ret) {
> +          if (ret == -EBUSY)
> +              goto again;
> +          return ret;
> +      }
> +      if (!locked)
> +          goto again;

Why does this sequence make any sense? I think the caller holding the
mmap_read_lock() is some historical artifact, shouldn't it be pushed
down into the hmm function itself? Looking at the callers it seems
like almost all of them want that.

I can't guess why drm_gpusvm_range_find_or_insert() is mucking around
with VMAs, a hmm user should never do that. I think I gave this
feedback many times.

Also, why the goto again? If it needs to loop again it should return
EBUSY.

> @@ -715,7 +804,7 @@ int hmm_range_fault(struct hmm_range *range)
>  	} while (ret == -EBUSY);
>  	return ret;
>  }
> -EXPORT_SYMBOL(hmm_range_fault);
> +EXPORT_SYMBOL(hmm_range_fault_unlockable);

Don't export new symbols without adding users please.

I suggest you add a hmm_range_fault_unlocked() instead and convert the
places that can obviously use it to use it.

Then maybe come with the unlockable version with an intree user and a
strong justification why something needs to hold the mmap lock
externally.

Jason
