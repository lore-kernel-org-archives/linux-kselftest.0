Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9906B3382C9;
	Fri, 17 Apr 2026 12:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776429707; cv=none; b=WZQVsux34BewkXQAnoYWJFgNrcY2lbQI4vCvewNGTBeIs7UmCOSnBsrzkBoLQq5MzVVAlujjKc3NCTE1/Sr0N1ryL6JC+hoTurwMhU47P5Ru7f0gvJ+SKNiqCbxV2e41zN6z4BOYDEABVnWpOhUP35pf9iWBArsVvZvN+J+/lFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776429707; c=relaxed/simple;
	bh=GUBplnlCMi99Gs/84QdBPA+gbdFXK1Nj+AsexHJodlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KZqBSCsxJHIj+L6P33J3m9JcsB8bQcJAJkblQRyeIl5BkSY0scHLCOr+udgVmTQsnkCF4HQ+vDIET/0dXa6VEA/JfBUd5UFNTN1FjTsyDJHSD9qtMUYswpSWkhB19nz6iZH7fXZvh5UTNmKQT8XFML+kByPS9qpxVs85BazmURk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RPB8bTUB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RPB8bTUB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E78DFC2BCB0;
	Fri, 17 Apr 2026 12:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776429707;
	bh=GUBplnlCMi99Gs/84QdBPA+gbdFXK1Nj+AsexHJodlg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RPB8bTUBq/1b9zMrL+pk2CxwlWv75pQfDdbN992NdkpZaIm0PK8auIyMKGKgx5VRb
	 U1CQsjOc3RzHsrCAjFAUllRWTWyrXwKefCh5YeqxUtd7jiPFJ1Dy5SECInSHTkpgQY
	 Opxv6KGhj6S5B4YQYdYAY7ZeNc7hr3r4/K0jmzE1G+f3gdS6izQwpzqfVYLivzalhV
	 TY0vOSx040V87BdmFuPB968ekB9Th5rHsOCUIippdM3228DsPzrwYrS45plgww8gCu
	 nWhQdWZ0Fc7L2HCf3iPq6b4FZymLzqgeAekH+CEqMTAJutUvk/XTgYZNhAgzjEmjEZ
	 f8O2zhXC8AWXw==
Date: Fri, 17 Apr 2026 15:41:39 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Mark Brown <broonie@kernel.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	Aishwarya TCV <aishwarya.tcv@arm.com>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: Specify requirement for
 PROC_MEM_ALWAYS_FORCE=y
Message-ID: <aeIqg0m3YL9OAyH5@kernel.org>
References: <20260416-selftests-mm-proc-mem-always-force-v1-1-3f5865153c67@kernel.org>
 <17ea54b2-d43f-49a9-9dd4-d2330a8daa92@kernel.org>
 <5357ef55-15c0-4c66-867d-898fa7f51414@sirena.org.uk>
 <aeE4XSuXY8RfphVs@kernel.org>
 <aee4e68c-077f-4056-9d40-69bc849d1538@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aee4e68c-077f-4056-9d40-69bc849d1538@arm.com>

On Fri, Apr 17, 2026 at 08:26:36AM +0530, Anshuman Khandual wrote:
> On 17/04/26 12:58 AM, Mike Rapoport wrote:
> > On Thu, Apr 16, 2026 at 08:10:53PM +0100, Mark Brown wrote:
> >> On Thu, Apr 16, 2026 at 09:05:11PM +0200, David Hildenbrand (Arm) wrote:
> >>> On 4/16/26 20:40, Mark Brown wrote:
> >>
> >>>> Several of the mm selftests made use of /proc/pid/mem as part of their
> >>>> operation but we do not specify this in the config fragment for them, at
> >>>> least mkdirty and ksm_functional_tests have this requirement.
> >>
> >>> I guess we could teach most tests to SKIP if /proc/pid/mem is unusable.
> >>
> >> That would be nicer, yes.  I imagine some of these will predate there
> >> being a configuration option here at all, it's possible there's newer
> >> tests that skip cleanly - I didn't look at the skips.
> > 
> > Enabling access to /proc/pid/mem keeps the coverage, not that it's great
> > right now, but still.
> >  
> > +	mem_fd = open("/proc/self/mem", O_RDWR);
> > +	if (mem_fd < 0) {
> > +		ksft_test_result_skip("opening /proc/self/mem failed\n");
> > +		return;
> > +	}
> > +
> 
> Change LGTM making these tests skip rather gracefully.

Yeah, the issue though is that open() succeeds regardless of PROC_MEM_
setting in Kconfig. With restricted /proc/pid/mem the failure happens in
write(), and there we don't know what actually went wrong.

We can try checking errno, but it's fragile and it's better to fail the
test if write() failed IMO.
  
-- 
Sincerely yours,
Mike.
