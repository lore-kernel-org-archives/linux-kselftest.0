Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EE950EC0F
	for <linux-kselftest@vger.kernel.org>; Thu,  1 Oct 2026 13:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862230; cv=none; b=QDD9IwOs+n1NO+7h6YPpPn/FCCPTJew7Vb32AV2XqwJ5fRvcA+FG4sJx0kEVInMKomc9f/PCqynftMgEg2e3sVEpfl6VT1jA9XI5JXP9peIxjf75PeLkoA8Nn/9uhsJyEfLsRXw981NBM86Uo+cjf2r9IEmY8HRNFce2fZvenIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862230; c=relaxed/simple;
	bh=k2tGWZBSq6m9m92JJesXcs78oXeXxRsuS4Ph2lEaE88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FLeeXrmfOTAEwvNTeukKYfqp8k4RYXwJPZcZx5hUtMznRs7F4jkDWqvHaAgAdf2eTam4BrJLAfAf1KIEE4x1w4QXMB52gkvv6L3TRqvFWAPUpFFmXDyHjM3y1vWXakxm20KHs0U/Bj/2JvK6iWkW3eNtWdSoTz/b2gMA3D01P8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=DqZEzPfD; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="DqZEzPfD"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ff9642c57so14056455e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 01 Oct 2026 06:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790862225; x=1791467025; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9GzyFhoA2S7uios3Q3nexzUQFEC9iru05+QnoGlj3hE=;
        b=DqZEzPfD04fpWPGHpCTt0gkiU5RVPxaVWzIV6kshqTUIZAhsEGYJWau1rm4ilNcOVV
         kDYECMPqc808q+3S/wlpfy4Zonr5JdeArGZ64LeZuynhvgIMus4R4su8oGglj1Lm7Q/p
         xxx0t/Ds/HICjF5naZa3MhdYJ2tCIUveTXkT1kUktpAP7fDBee/DrFA6B2C1G9r2Jj2g
         5eYtQtWNQIU+buEp98MmqzloVUNOrJN0KKDuaFOJuhAIgLy4U+ZO06buaRmY3e9CuhFo
         Y0rBd+PaERYcDD4xyDCY8m85jdUwuLOCOlAI8xp9OxbIPPERM7P2dkthIqK0cpQLltUy
         omdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790862225; x=1791467025;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9GzyFhoA2S7uios3Q3nexzUQFEC9iru05+QnoGlj3hE=;
        b=bXQHz/tzfm5iQM271NXV0XO6P65kLUC9C85+jTa6JSVw6v7ScdO3yaVyzD6z9snFJ9
         wR6ZFq69ikDsi4KVBAR2I6IaoCOZiuOwrtM/6ZCJUkfXwYuc5Aqi3s1JBgpOFPe5KSpy
         5x0A23XzkilV8DaGlVUw0+YS9ELuCQbtnWG31+z2WlSvf8OzDS1MqZ2neeppDK+CT1d1
         GEn8GweWtdcZzCqC3/5NC2t/WJwpb6k9M716GVGhMR6xJs4MyBNN8oNYbyUL6I2u2EVX
         vxXPG/tE2tBnhNsaOauAq+IO7YALyz/EXRR+Tgq1f/UQIA5WnTkXjxFJ6CofUlY+nlZ9
         W+pg==
X-Forwarded-Encrypted: i=1; AKwUvBxdrZ8raN2Ig06k/nHoTec7cavPONkYCHbk2lnhjGvSlyvj0I38o91y2wvYX2wAxyGXSBWE6NVM/sMxm3GP5l8=@vger.kernel.org
X-Gm-Message-State: AFuF++lGoxdt1II34C3dURrCI60nxVapOeNuztR61Hegn+ncDFgqDBkz
	/qIA1IXSl11QWO1w6Fgrtpudmxj6FzY3cYPRXVxBUiGA22PBOLroVAVGEiaIae2DG+w=
X-Gm-Gg: AYBFou1pUS+AQENGg7RnOKAe0IEipwXJngLyaylohzmbsRwzbf0dBTcLwsoubbL/rEQ
	SAzLQvfflVPaBERrPPhRjUav3d3zz914ZWG8uV7uu6UrW3pAcfWOHMeiq9E/h8TN8dOMJV5VNK/
	c7lKb874OKH4UUfzBV69UrJgmN9B7xYJ0A8kY8ZXC7Leq1JUfiC+ia1kaONmyjEsPL0wPPagMJ0
	T4PpoYNJnITAD1hHYE3Md4H7jd4M/GMCbFSekCsBiQL+RGPPIhWo8/d4/M5ILtA2xkfk5Q2MnCk
	kBIa7CDGfOdqYJFk2B0sKxOg1d7YqY4AD90Tj3d8rIfSvG6TtsEucDNQDWKB4gfsX8DtIRWQH0C
	uCUWB/b5CJMl8rzvXjLrbY5jhBmtcRYD/sUrGlmBFrQKmywZtHyMv6oD5lEsmK+ghHykCT3JS4E
	9caK+xx+Hf3C48QdqeR3Jv7JSjx6BOiWGyUejwzNAVcNj8K/hBGmAcbhs1KXkpeVxoloQ=
X-Received: by 2002:a05:600c:4f52:b0:4a0:22d5:21af with SMTP id 5b1f17b1804b1-4a022d52255mr32632575e9.15.1790862225048;
        Thu, 01 Oct 2026 06:43:45 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c092:500::6:7dd1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a023ecef86sm33062845e9.3.2026.10.01.06.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:43:44 -0700 (PDT)
Date: Thu, 1 Oct 2026 09:43:42 -0400
From: Gregory Price <gourry@gourry.net>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	David Hildenbrand <david@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <shuah@kernel.org>, vannapurve@google.com, erdemaktas@google.com, jxgao@google.com, 
	rientjes@google.com, fvdl@google.com, jthoughton@google.com, tarunsahu@google.com, 
	pratyush@kernel.org, fuad.tabba@linux.dev, David Woodhouse <dwmw2@infradead.org>, 
	yan.y.zhao@intel.com, michael.roth@amd.com, suzuki.poulose@arm.com, 
	Christian Brauner <brauner@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Nicolin Chen <nicolinc@nvidia.com>, Xu Yilun <yilun.xu@linux.intel.com>, aik@amd.com, 
	aneesh.kumar@kernel.org, Vlastimil Babka <vbabka@kernel.org>, kernel-team@android.com, 
	kernel-team@meta.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC 00/17] Allow guest_memfd to be created using a
 resource (pool) fd
Message-ID: <ar5iaaLcyz9dCXQI@gourry-fedora-PF4VCD3F>
References: <20260925-gmem-tmpfs-backend-v1-0-d36159822d18@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-gmem-tmpfs-backend-v1-0-d36159822d18@google.com>

On Fri, Sep 25, 2026 at 05:50:47PM -0700, Ackerley Tng wrote:
> + e.g. for tmpfs,
>     + Use mount page size.
>     + Respect mount size limits.
>     + Use guest_memfd mpol and fall back to mount mpol.
>         + Gregory, now you can set mpol upfront on a mount! [3])

I haven't had time to quite give this the read it deserves yet (have
been traveling this past week), but I think this mpol/mount issue can
be solved with a new dax driver (which maybe provides this provider
interface) without needing to involve numa policy at all.

Essentially

fd = open("/dev/cxl_dev", ...); /* backed by anondax driver */

then later when a fault on that fd happens, the driver provides an
anon-memory allocation that explicitly requests the node associated
with that device - as opposed to trying to jam this into mempolicy.

If you're planning to be at LPC, happy to discuss this in person, but I
think this provider pattern is likely much cleaner without mempolicy at
all if you can just make the provider do that allocation path for you.

~Gregory
