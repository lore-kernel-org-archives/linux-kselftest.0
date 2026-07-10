Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD6733E351
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 01:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783647022; cv=none; b=rVyEOFnw50Z5/3gkKGGoQXuYu6gIedLax9GhIhzm57aFbHRCMA5nyduFdVOxd8J2cyeTaDrgcFSt5SNqGFYkvhsZuFbExahv2d3MbYHZDLAWAMG5RcrDc2S+e0ilUzzm7wmJxWFG2Z+d+CF8Gvy80N48ZvFwczoI/vOlTRT8ksU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783647022; c=relaxed/simple;
	bh=3rYTe8e2Wt412qzExNzuhcRev2Wp33ZA51eAifLPzps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jagF005FIYXMgr1WHyVOJNUtQ1Grt3d0sOixbQ35gEUM1gvBZrRGjh0ucJcowU6PmW2BX5H4FEMqDaS2U79KMT1AegUe3HvQwQmD7MsOw6lD0EKMxZ5BF58GvSdAuaREdpzL9i84YGV1zH/8gZ/cpcC5qTQR8Hk5DHAb6jGJHLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=ezt3K41n; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="ezt3K41n"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8f1a8e914a9so3875546d6.1
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Jul 2026 18:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783647020; x=1784251820; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VaPhGtocKLbFXsyQXoR9g3DKOWhugqrS27IBZSVVhcw=;
        b=ezt3K41ndVI8K/PBTlFKFJBkY+47UWEjGaVnCpfxtVzzaiLbm1NZQP6lwkzck8cAHd
         nWxzWpxujl/DWdoer7tQfKNaNXZQmPIQVtdWuMXWksgOJiB5bfVbRZYU+Y+LrAKPUVOT
         ut1oh90UnAc9GcZxvnx/kiCbksRghpUtOSXdGxhPAbQIsCj5NCojyP+4R1JS/tuFlPY9
         Pw8gCJpbLxPeZj8pFil6k+itECVO5PzKojFiKr3gVw+6Z1oVtednjjAh+hSV8OzDCWdB
         bSQNJ9stOPQtopOblsEqCLS/USMKedJen9MlXZszjjaMRh8Eph3kP1wJVtoS0CPOVX2F
         HXVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783647020; x=1784251820;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VaPhGtocKLbFXsyQXoR9g3DKOWhugqrS27IBZSVVhcw=;
        b=TAzTjuBa/SRSGat+zkFwIZig7wKuFiGSN9aa+KO4qMrh8MS0KD4PfthP3aApKiZNWW
         k2CmCRP2uV071Zbf4cmR0vzfx5F2KbDwN+SYgz324DC5ObVkhE32e1aNsoFdhmbr+K1D
         l2jWYkVzd9v1ZkBE5eS4lzl5vnbTjwLQQ5GlOnwZKINlwSGvecvNIJVaxAed/gde33Ne
         u1Stm24xhq93E3MqEd5TwtlaOFMY6ja/08tzABED2Vrq834fwPBolSKTvfzDAM2KCz+u
         9DPbnTueaj3f/1woImU+Xrx/XfW28fnvosCgFCV8NWwQ9ZNsoilgG7ZQPZ50mQycKMOb
         Umjw==
X-Forwarded-Encrypted: i=1; AHgh+RqwwXGDIdbOO4Ev13onoZBpaFwDUAM9FzcttH/RLMY+CwU0pgCX7nqkALTrHeTTrMgBixWl06XjezAI1UgZyz4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4nnY2Ns7hQ1yT5qP9K0NBb2dMIOmT69sUQAtnn/yc0NpBcIT+
	Ec8ofa9dwnhJnVROu6uIKu7YASo9DelCD72rA03hGqzNz91sUUWpWC9WqloUUDWPxQk=
X-Gm-Gg: AfdE7ckwKBAECE9GAqhMF22D7Et6BrEMW+vsFTVdSkYBW0kkfRYdV7+2H329M0VIYnn
	TwyWlj0zIiDfnObnpRHJ0r+hTh/XmMcHkmbwna0M8Owk9XU3iqQn4GFn6mxUl4OvOPb/yBun3uk
	schjeOf2E6TnLuTrQ9JGGl47EmTZka8c07vvv4Euyh/75ayV7F1ouOqVdJclWi8IqtgWkZxLag+
	iCHivIdhaKWo2qvEplfRoM9yfvN3Xi4TTNoHJlgJC3CMoOr7hJmvqkVugeA0d7jYW2xzIgKukS/
	8g5UZngep3v/oKcMEfBrjsih36ZmhRhcTe7pO8PpzIfYVfhOy8YAEIxDBDlUpIcddKufMynTzx5
	YnTPb732fT84yDuLtv9dg9naplJpeWHXOcVTK4AdlaBdeaBWwzV6fbSZTJBcOu1Fz9ovUaloJHQ
	OVK6WIFeKI4+MicKBfYQ/Wn6tbq8cygoQEmeiZrBhOoBn9fv7VcvnxfS2QVKeEvRkkpP7A
X-Received: by 2002:ad4:5c8a:0:b0:8cc:2a92:48e4 with SMTP id 6a1803df08f44-8fec217b8bfmr110693186d6.32.1783647019857;
        Thu, 09 Jul 2026 18:30:19 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd7c1e8aesm29789146d6.28.2026.07.09.18.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 18:30:19 -0700 (PDT)
Date: Thu, 9 Jul 2026 21:30:14 -0400
From: Gregory Price <gourry@gourry.net>
To: "Dan Williams (nvidia)" <djbw@kernel.org>
Cc: linux-mm@kvack.org, nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com, david@kernel.org, osalvador@suse.de,
	gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
	vishal.l.verma@intel.com, dave.jiang@intel.com,
	alison.schofield@intel.com, akpm@linux-foundation.org,
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	shuah@kernel.org, iweiny@kernel.org,
	Smita.KoralahalliChannabasappa@amd.com, apopple@nvidia.com
Subject: Re: [PATCH v6 07/10] dax: plumb hotplug online_type through dax
Message-ID: <alBLJoM86ujz5Fg1@gourry-fedora-PF4VCD3F>
References: <20260630211842.2252800-1-gourry@gourry.net>
 <20260630211842.2252800-8-gourry@gourry.net>
 <6a5016bf71df4_3b7ee5100b3@djbw-dev.notmuch>
 <alAb7Q_Ku5dVRKZ7@gourry-fedora-PF4VCD3F>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alAb7Q_Ku5dVRKZ7@gourry-fedora-PF4VCD3F>

On Thu, Jul 09, 2026 at 06:08:45PM -0400, Gregory Price wrote:
> On Thu, Jul 09, 2026 at 02:46:39PM -0700, Dan Williams (nvidia) wrote:
> 
> This was more a matter of having the DEFAULT set consistently across
> the dax driver variant probe() functions to make the behavior explicit.
> I didn't want an un-set value bug to creep in here somehow.
> 
> Happy to drop them if you think that's unneeded.
> 

Ah

Not setting the value in each of those places is equivalent to setting
MMOP_OFFLINE (0), so better to just set DEFAULT regardless.

So unless you have strong feelings i will keep them as-is.

~Gregory
