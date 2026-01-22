Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9650378D98;
	Thu, 22 Jan 2026 21:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769118348; cv=none; b=LrygaKrGnLfXDcCL/Sc2mUZnhCfaatZWlFypGUGACPgW4Qwp9DOUJDD2Du9DHgRPKCMNOHomYkacvqjb3ERhFAYX6qNko9IBFayHVNUDRDqD3HTVwI/CewRBsA4u1FsDGTso+kTyVUq17oJX5+oZ5WyqHNiSXMZrlSQGM/qN+sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769118348; c=relaxed/simple;
	bh=yANGJHQL0A38lUIC4FmfeO16eQwkcDOCa+9Bn3LvhSY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ArnopNn58pCanJrIFkl9PuxZ5CLzxDrxWusjzUeBmJXGL4cciyongplo15zIlB5wFCbwqvbeUUIADmnCCjDwSLOdugPTYcSwVkKwo5ux/gsdJx6PdooS7wxrrZcBq3K+YjTEjr9DLLIQJnTlEf5vFcafRmJQwYNSqml2GpMlFRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=YklrXJq8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="YklrXJq8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CB41C116C6;
	Thu, 22 Jan 2026 21:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1769118346;
	bh=yANGJHQL0A38lUIC4FmfeO16eQwkcDOCa+9Bn3LvhSY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YklrXJq8mByufQXXL3Pef80d0G25FubPZwittKH/lU7vxk+hXCnFntw7MVxgX1910
	 IYbpOoEWx077G/tb3c2iyikgMyhP9PuF7JniqRHq+eyofcnBWDM3qP4P4calsgG+HO
	 93pFLN3CmUSlV0WyAJBXjUm7x2XKeip17Q5ORZcY=
Date: Thu, 22 Jan 2026 13:45:45 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc: zishun yi <zishun.yi.dev@gmail.com>, "shuah@kernel.org"
 <shuah@kernel.org>, "linux-kselftest@vger.kernel.org"
 <linux-kselftest@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "richard.weiyang@gmail.com"
 <richard.weiyang@gmail.com>, "reddybalavignesh9979@gmail.com"
 <reddybalavignesh9979@gmail.com>
Subject: Re: [PATCH v1] selftests: udmabuf: fix hugepage size calculation
Message-Id: <20260122134545.f46396efc68add3ed214bfa1@linux-foundation.org>
In-Reply-To: <IA0PR11MB7185798382D21B45FAC56044F897A@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20260118135126.102472-1-zishun.yi.dev@gmail.com>
	<20260118123825.c124bd2e01fabc1d78620d87@linux-foundation.org>
	<IA0PR11MB7185798382D21B45FAC56044F897A@IA0PR11MB7185.namprd11.prod.outlook.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 22 Jan 2026 06:47:54 +0000 "Kasireddy, Vivek" <vivek.kasireddy@intel.com> wrote:

> > >
> > 
> > lgtm.  Vivek, can you please check it?  Feel free to merge into another
> > tree and I'll drop the mm.git ccopy.
> I think you can go ahead and drop it as this patch is not fixing a bug but is
> modifying the tests' behavior to create the udmabuf with huge page sized
> chunks which, although not wrong, but is not the intended objective for the
> given tests.

Great, thanks, I've removed this patch from mm.git.
