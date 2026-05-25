Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6054A2B9A4;
	Mon, 25 May 2026 11:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779708265; cv=none; b=Lw3H7rKC8vUqFU3Ny6YKMDH/3AHg0CBKc5h2HSjcI6TsxZJphPCM4BpBJEiprdro9jrNMmFp11UDMXddsZOUNwje+KMHe/McLbYgL1m1tNcZ350vneCsRe+llr9Zw043COort7dxantDsrfdJ12CTAU0lzXWt0boJrsivEfskss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779708265; c=relaxed/simple;
	bh=wZSZpoCQ8yheclPXx9LgHAvdLhfEOdqxrHSfBMdWsqw=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=t9nA4tHyxdPF5RPPDhx2lavT0N71fzpB1VUH+wHcX+KZ5To5TqlNy+p+Bl16kOUeISwkaWIrreO/bu23kjYEhkTM7TcGVFJ9nLBZrD6h8+qo44TKHUKwGR6nDJVK0vKBUR1ENIBIlTjb2wUPF86CZkljaXKSyHlwE/qRzVACi34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NrUdGUtc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NrUdGUtc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A97B1F000E9;
	Mon, 25 May 2026 11:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779708264;
	bh=lTkrNOELWZr8RdZHj18oo4hwbTBtjTNzSnJO48KWYLM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=NrUdGUtcv1upc8503i/SWwLghU0nTsZE3mbLl/zX6G8T3puMs7bgJjpdYscqLeCm3
	 VNQw/BAopGUnH4GL/qjRfBuBHSf5uLQjObMfByWuM335/hQO+9qeK2sSjQFma4HB9w
	 wqJ/7TbfUNZs6jd7ghQ3DUMdzhCYYQeQMWGpq1ahjRtDmEtJ+EYPfFaOaBNDkhBgM9
	 k8jW/PgF9PqXZrRqP3Pxo/snC51+0ApDgPHBTIudT+0WruYb4EMziNGZx/KlVcJZSc
	 gRqLxdEnmkynF+t3XioL50S7hZvZj9opcFAGfCcLcXSID+6reyalojZjdMlp3qVyQV
	 zN0HV+jUnHZVg==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/7] LoongArch: add KHO support and selftests
From: Mike Rapoport <rppt@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, George Guo <dongtai.guo@linux.dev>, 
 pasha.tatashin@soleen.com, pratyush@kernel.org, kernel@xen0n.name, 
 graf@amazon.com, shuah@kernel.org, loongarch@lists.linux.dev, 
 kexec@lists.infradead.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 George Guo <guodongtai@kylinos.cn>
In-Reply-To: <CAAhV-H4p8xe_Hfx81kjxNrp5g7RKvi4f1QM7avLvnf_r+VazFA@mail.gmail.com>
References: <20260525062810.103367-1-dongtai.guo@linux.dev>
 <177969529480.4047269.2120994507098781563.b4-review@b4>
 <CAAhV-H4p8xe_Hfx81kjxNrp5g7RKvi4f1QM7avLvnf_r+VazFA@mail.gmail.com>
Date: Mon, 25 May 2026 14:24:18 +0300
Message-Id: <177970825876.4071219.16831083000796070841.b4-reply@b4>
X-Mailer: b4 0.15.2

Hi,

On 2026-05-25 18:25:08+08:00, Huacai Chen wrote:
> Hi, Mike,
> 
> On Mon, May 25, 2026 at 3:48 PM Mike Rapoport <rppt@kernel.org> wrote:
> 
> > On Mon, 25 May 2026 14:28:03 +0800, George Guo <dongtai.guo@linux.dev> wrote:
> >
> > This fix looks unrelated to KHO, it makes sense to send it as a separate
> > patch.
> 
> He tried, but it causes new problems, but I agree this patch has
> nothing to do with KHO.
> https://lore.kernel.org/loongarch/202605211925.DbDvQ6ii-lkp@intel.com/T/#t
> 
> > And I believe that patch 2 and patch 4 can be folded into patch 1 so
> > that addition of KHO support will be a single patch.
> 
> Patch 2 should be folded, but Patch 4 can be separate, because it
> should be backported.

Fair enough. 
I'd suggest to move the fixes to be the first patches in the series, but
presuming this is going via loongarch tree it's up to you :)

> > This should be folded into patch 5 for sure.
> 
> I completely don't know why Patch 6 is needed, for normal use I8042
> doesn't cause problems in virtual machines.
> 
> Huacai


