Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189813BC69A;
	Fri, 13 Mar 2026 15:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773416421; cv=none; b=D6ikck9hJgjWzczeM5Lt52lQCp1XcryqnyI+S6MW0s/FBFysCdgMb1F9fVGmY8wXXQqtmlhJ9Ci7kt6VedvhdOocuB3NdYHg4z8J/hgh+HzRIbWPTaWPfmLa2L5pi+FtDJihJXb3m5pNnnNP/roJq5HURjRK25wc8PWnXyPi9vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773416421; c=relaxed/simple;
	bh=pwb/Ix5jC1tAW+ErobqQ5iF4F/G3peyTxTbfmU1XGjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RV/4XlfHPbpJfzPAQVnjY2q+JGZWzYZJkH8DTo4bw0pX/QDl9fEW6xQHvirxAptUopP8EIpgNWrvuzP1HrwPbKmAHdn4k5kThOHNHIxbwpAFQ0z23xcb3zYfJAXlUGcFSKBrFyEP2+opbnFgea6JkCfux/RFGBgs6kmoqLNDFQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nKbp0tik; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nKbp0tik"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34723C19421;
	Fri, 13 Mar 2026 15:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773416420;
	bh=pwb/Ix5jC1tAW+ErobqQ5iF4F/G3peyTxTbfmU1XGjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nKbp0tikNz9cHqTQsUNTiVm08JCp0gVeXxTbxWur61UQyg3WtGaOpohGDd6s/y7Z3
	 ZnuwtK8eylQDGefKyEv03T2+UtutBIOS9k82FoLHMeiNOvOVimuvRKVoWBhnEn20oH
	 E5z+pdhcfRtTz58G12rgvz1gtHva6r1wZ5yIn16DWAprc1TCk9e5f+S7r7LMNMjTHa
	 2Q0fsGlz0boe8NpUN6Ds6vaAN+Z99RiG7h6XIDLQCN3GtzMrg95u/BNAzLvBvPXMy6
	 3AVmfDK3p+Qa2Sjrz61SDOEsWcxrLouEUPs5FPq06yBhSPhNgUzVQtt/qBJcK8pL8g
	 Ljv2XJ1QO550Q==
Date: Fri, 13 Mar 2026 15:40:14 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Chunyu Hu <chuhu@redhat.com>, akpm@linux-foundation.org, 
	david@kernel.org, shuah@kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, surenb@google.com, mhocko@suse.com, 
	ziy@nvidia.com, baolin.wang@linux.alibaba.com, npache@redhat.com, 
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev
Subject: Re: [PATCH 0/4] selftests/mm: skip several tests when thp is not
 available
Message-ID: <68b17560-3033-472c-9638-a2e2058529f8@lucifer.local>
References: <20260312114027.634559-1-chuhu@redhat.com>
 <abLHz2qjdeNqdFaZ@kernel.org>
 <abNZmiL2C7KMQM1t@gmail.com>
 <abQq-Mt0p3vz5rQm@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abQq-Mt0p3vz5rQm@kernel.org>

On Fri, Mar 13, 2026 at 05:19:20PM +0200, Mike Rapoport wrote:
> On Fri, Mar 13, 2026 at 08:26:02AM +0800, Chunyu Hu wrote:
> > On Thu, Mar 12, 2026 at 04:03:59PM +0200, Mike Rapoport wrote:
> > > On Thu, Mar 12, 2026 at 07:40:23PM +0800, Chunyu Hu wrote:
> > > > There are several tests requires transprarent hugepages, when run on thp
> > > > disabled kernel such as realtime kernel, there will be false positve.
> > >
> > > I presume that when THP tests run on kernels with THP disabled they fail
> > > and it would be a false negative rather than false positive.
> >
> > This is an interesting point. I'm not naitive speaker. I just learned
> > from AI. It really matters what we define as 'postive'. I presume 'postive'
> > is we run selftest and got a failure report, that's postive, not thinking
> > as it's thp disabled kernel and a 'pass' is postive.
>
> I think that a passing test is "positive" and a failing test is "negative".
> So a test that fails because of misconfiguration is a false negative to me.

(Ostensibly native speaker here :P)

Yes.

False positive = the test passed when it should have failed.
False negative = The test failed when it should have passed.

Cheers, Lorenzo
