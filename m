Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B6539B94D
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 19:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781291308; cv=none; b=PQn7TGZ3O0ECRy2z+xJ7igMCAzN+/RhrLoi+VoMWdILCF17EWeXQBP61gYcn6ENK1HOyCksnSOGQTLaL+8LQOpObB6JXzFRg2YDh8DGePLKoceUfGj6YJd7T5pjAkNCOAENuOK0YG4fLpAZ1Qdv3RAsaIWrutGm30newdwuR41Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781291308; c=relaxed/simple;
	bh=6rW6wvm0s+0dDXzGD/rvCdVFfP5Yrd5N/fHeXn9JpWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O+XDhvI5PzP+24ttd/w9DOM0Kx+ntTOrjgX5qf86TmSd+7z1MoM2bK74qjpKbKUjqgpzAWqcPWFYY3hv8gsPtHAoJ8WdXuneUemtLgfP8ZB22QhoLiwFh6kXWmDT306Q6e25DlJTcYWLof5+AZSYbWDIBbpOxV23jYWcIKSJh4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=aLe0GPNR; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="aLe0GPNR"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-91587626ae1so151269885a.3
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 12:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1781291306; x=1781896106; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s08faKqvDPkMJtxJMkDBvBUzs4ZbUBDPlDmo4vFtWCY=;
        b=aLe0GPNRQ7lFq6R/1cAQw/pWGvT1erGQFUZARUzkDH1SWXWKvHyqDDWiJjjEhJIhI0
         dH9tsjgksS7XN1MgKB9qjO5x4aMGGBKHPeMBQULWSAEVvLXugm99HDBaX/+csPzjAHS+
         doI/5D3ffJvF0+EyEwD0QuMIv91iqMlL0BI59aUoK+FF+h9DbW/vsi/7HkUrD5IfuYcd
         WZfyP8+oKtygk6ESMgZ+ee4lNPFkYafp6EeMrssCv39m/SJ5B90x4MBngLD9ramSsmHK
         3tchmbdaEoEHluV6CTEMEbW2jn+bX2OprfrsB4+xB0BYaLw0WK7Eu65/an5euEHF/DEN
         Yf+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781291306; x=1781896106;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s08faKqvDPkMJtxJMkDBvBUzs4ZbUBDPlDmo4vFtWCY=;
        b=koZOcR//3+O/CCOMxol/YUI0miAmWc5zuyz0S6k2RvYAXMxDg60DMOsyQdFKuFDSRw
         5lF6glaxUjD0VlYLhcrFyYB8+7q9korQv0aaJPxCdWR+NkhTKUtXMzgvVqkbwYLMyImL
         ogdlE1mIsS+zA8Oa9/JACKzgyMtr42qi6FtG3W/bgXw/xjOd6weU05qiubTcTttb1yEe
         J7A7WpKe3/aPWuPtyL7PsMoNIA1X7G0pYWyvj6K6eEg1VAwyaxwXQi53Vk9pMKB2L8Eu
         jlWBTf3/eqMExya8oWcoCBL146d3iLNAsHrw7cMxVRSyRfvPrO4aPf8bPLTGdx0LFD16
         F7Lw==
X-Forwarded-Encrypted: i=1; AFNElJ+30BlYfqb3HoX3C6IIvZKduMtjxXUnhXBdweT/7sycedQEFFPteTJuXutBTYbWbtW/IOnioiporawN8PZe3OI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkBVi/OC4QaHrDa7e0aMpBE7WcMsi+mHyj3u4QuI+7ysg9Z+9L
	g2MXQXatRAlK4xc+h8FnmnfB00TjMUO64sV/YI5+hOEklqa7+zE5ggAoJfxsPrdSe00=
X-Gm-Gg: Acq92OH2FsYrFg8/hWVTkagHvNKzDUA9sazIUhYDe/UcGou3fKqtRM946hkdM1TyXC4
	5BG6czn1mBm4urzgBawUzFHrIgMDYKETj83TFHu7zkxl8GZtFp0qU417CQjYe6cAfQZEMc6TEjO
	FcAI6WInU9ElktKZTvXMeP+l+VBtSejAgUp3O072hkXjVoRqoMy782hi6P7rulBRupyFJnnnVAT
	UVz/vAc64dLZZjisd1S1isGyIWe9jGAWSYOE+D+/+fJ4uIijx4bXR+3Sr1gOGmXGm8ptiUYH5C3
	NL8bvsa5QjhuARusmtmUCqO6kpwHfp5MXzURzgddnNyIgpSQ7xQEGQtRWCM76u3/wC3K0tBBiUT
	YG01Oi0fZulGywZy/CO5p50eXTzpgjCUOb8tuGgtDhCWcguxfIktT+yXxzJlOtMukWYWJ7AaC8e
	XUMVQN34vBPEnydCrHMYrSHyZ/yFAzCrZXeahoWmJTMov+d8sKPBg=
X-Received: by 2002:a05:620a:c45:b0:915:c858:7d42 with SMTP id af79cd13be357-9161bae70eamr627465485a.18.1781291305692;
        Fri, 12 Jun 2026 12:08:25 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91619f2d6a5sm291127785a.20.2026.06.12.12.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 12:08:25 -0700 (PDT)
Date: Fri, 12 Jun 2026 19:08:23 +0000
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Mike Rapoport <rppt@kernel.org>, linux-kselftest@vger.kernel.org, shuah@kernel.org, 
	akpm@linux-foundation.org, linux-mm@kvack.org, skhan@linuxfoundation.org, 
	linux-doc@vger.kernel.org, jasonmiu@google.com, linux-kernel@vger.kernel.org, 
	corbet@lwn.net, ran.xiaokai@zte.com.cn, kexec@lists.infradead.org, 
	graf@amazon.com, Logan Odell <loganodell@google.com>
Subject: Re: [RFC v1 0/9] kho: granular compatibility and header decoupling
Message-ID: <aixXuoCOCZZcBDci@plex>
References: <20260605033235.717351-1-pasha.tatashin@soleen.com>
 <178083348872.1648214.17778188633648887952.b4-review@b4>
 <aiVp5RlbWRz5VnPB@plex>
 <178091437240.1648214.10761111570005003901.b4-reply@b4>
 <aibYJvzQQnpoN6YW@plex>
 <2vxzo6hjss8z.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2vxzo6hjss8z.fsf@kernel.org>

On 06-09 16:28, Pratyush Yadav wrote:
> On Mon, Jun 08 2026, Pasha Tatashin wrote:
> 
> > On 06-08 13:26, Mike Rapoport wrote:
> >> On 2026-06-07 13:43:09+00:00, Pasha Tatashin wrote:
> >> > On 06-07 14:58, Mike Rapoport wrote:
> >> > 
> >> > > On Fri, 05 Jun 2026 03:32:26 +0000, Pasha Tatashin <pasha.tatashin@soleen.com> wrote:
> [...]
> >> > External users only need to include the headers they actually use. For
> >> > example, LUO shouldn't have to pull vmalloc or radix tree KHO
> >> > declarations, and memfd does not need block.
> >> > 
> >> > From a maintenance point of view, it is much easier to catch ABI
> >> > changes when the file with the appropriate version has been changed,
> >> > and most likely the version of that file should be updated. If a single
> >> > header contains compatibility versions for several different data
> >> > structures, it is easier to miss the correct version update.
> >> 
> >> No matter in what files the definition lives, someone can forget to
> >> update version and we may miss it during review.
> 
> Perhaps we should have some tests (maybe with kunit?) that can catch
> this? If you change the format, the test fails. So you'd have to go and
> update the test, and at that point it should be more obvious that ABI
> version needs bumping.
> 
> [...]
> >> 
> >> Sorry I wasn't clear. I agree that kho_vmalloc, block and radix tree
> >> should have their own versioning rather than rely on global KHO version.
> >> 
> >> What I don't like in your proposal is mixing versioning of a component
> >> with its dependencies.
> >> 
> >> I think that versioning should be completely local to each component.
> >> LUO should not care about kho_block "on wire" layout. This should be
> >> encapsulated in kho_block.
> >
> > That is a fair point.
> >
> > As I mentioned in my previous reply, we can definitely look into making 
> > the version checking more modular. For example, each component could 
> > implement a standard compatibility-checking interface.
> >
> > These checks could run early in boot to determine whether each component 
> > is capable of accepting the incoming preserved data format.
> >
> > Whenever the component is later used by LUO, memfd, etc., we can query 
> > that cached status. This achieves four key benefits:
> >
> > 1. It avoids delaying the compatibility check to the actual time of data 
> > retrieval, which is too late to safely abort.
> >
> > 2. It prevents a local incompatibility from triggering a global kernel 
> > panic, allowing us to handle failures gracefully for just that specific 
> > component or session.
> 
> I think the right time to do the compatibility check is _before_ kexec.

Absolutely agree; however, that is a bigger effort than what I am 
attempting to do here. So, let's remove composite version strings and 
integer strings from this series altogether, and simply make it more 
granular. The versioning will be solved later once we are ready to 
address the pre-kexec compatibility checking.

> That is the only point where you can safely abort. Once you boot into
> the new kernel and discover you can't understand the passed data, you
> are in a bad spot already and should reboot. I don't think think you
> really can gracefully handle these failures.
> 
> For example, say you fail to understand the incoming PCI data. So you
> have no idea which devices are participating in live update and cannot
> correctly probe any of them. Which effectively means you cannot resume
> any of your guests since you have no idea how to restore their device
> state. The only path you are left with is to reboot. I haven't read the
> IOMMU series, but I imagine the same story applies there.
> 
> For a more benign example, let's assume one of your memfds that back VM
> memory fail to restore.
> 
> In this case, you can safely leak that memory and run the other guests,
> but at that point the host is in impaired state. You don't want to keep
> running it in this state. You likely either do a reboot, or if you feel
> more adventurous, you do another live update.
> 
> In either case, there is no "safely abort" after the kexec happens.
> 
> So I think our energy is better spent solving the versioning story
> _before_ kexec. After kexec I think it is perfectly fine to error out
> and panic or expect a reboot. You can't salvage much at that point
> anyway.
> 
> And I think how the versioning format looks also should be based on the
> design of this pre-kexec check, not the other way round.
> 
> >
> > 3. It keeps the local version local, as you suggested, so it is checked 
> > only by the consumers of that specific component.
> >
> > 4. It provides a clean path for backward compatibility, as components 
> > can individually decide whether they understand the incoming data 
> > format.
> >
> [...]
> >> 
> >> Actually FDT "compatible" handles versioning nicer than composite strings
> >> You can have
> >> 
> >> 	compatible="kho-v4", "vmalloc-v1", "radix-v1", "block-v2";
> >> 
> >> and check fdt_node_check_compatible("vmalloc-v1") for vmalloc and
> >> fdt_node_check_compatible("block-v2") for block.
> 
> I agree. Even if we don't use FDT, something more structured than
> composite strings would be nice to have.
> 
> >
> > That is actually very similar to what I am proposing—individual version 
> > tokens (which in my current series are concatenated into a composite 
> > compatibility string separated by ';').
> >
> > But let's not get too fixated on the composite string formatting. I 
> > actually really like what you are proposing: using integers for versions 
> > and having each registered component carry its own "NAME" and version 
> > number in the KHO FDT.
> 
> There is another nice thing about numbers that Logan (+cc) recently
> pointed out. You can tell which one is bigger.
> 
> At some point I think we will support multiple versions of a data
> structure to allow for upgrades. At that point, it will help to know
> which one is "newer". So if both kernel versions support version 3 and
> 4, you can use 4 to serialize.
> 
> This of course is harder to do with strings.
> 
> >
> >> And we wouldn't need to reimplement string parsing ;-)
> >> 
> >> But yeah, I do see value of making components versioning and KHO global
> >> versioning independent. I just don't like composite strings and I don't
> >> like mixing versioning with dependencies.
> >> 
> >> Since we are moving from FDT for the most things, version should become
> >> a number rather than a string and version compatibility should be
> [...]
> 
> -- 
> Regards,
> Pratyush Yadav
