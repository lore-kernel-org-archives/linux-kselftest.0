Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C3239768D;
	Fri, 17 Apr 2026 12:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776429472; cv=none; b=ppqerIgK/oXw4MNHhdcZnUEGHWnlYTWAEFZGG+XLO4FALCI7RCyPSChA36sue791DqknfeZ3SUYosWkPea030mwSbgw3NmgDCe189iIPluUBloD6N4GTWH6SSvX1CS06XMrKsszA1epzUDpyjQ0aROOgwWBo8QK22MFM6TT9hHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776429472; c=relaxed/simple;
	bh=3V+1JeRzd24DClnOrQ9aq3AVM1QM0xWwhGfZaoC1XwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OjtvyBOjmpj7JfC8/SWb2ENJvptPQDW8CwYdJvTPYVIJlHE3rBWiCl5V09XCx64Thq+10varsrH+5cQ0EAAI0qLic6EBnDdsRm9sMge0rPaBLQfQLMEWmh+WWA54InaKmm/cEVUfPCtKBy1fzzwP730GBvC1iiAKHYWJdIxWW5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LJI48adG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LJI48adG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55C8EC19425;
	Fri, 17 Apr 2026 12:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776429471;
	bh=3V+1JeRzd24DClnOrQ9aq3AVM1QM0xWwhGfZaoC1XwE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LJI48adGM3785seEzMFbj3rLKP4F/ni5aDsMwk04wQQep35nTAdL1EFbi/ueCoDJW
	 x982Ls943GgCo6EKbr/7p4oQUGlKsalbxal+5EdwrBJSWiq05Rz/pmzxNB7+uOlaU3
	 eMbLwRLPXuHXPYFIrDLJKG/N+l6h/LuHQ3H+C1sP8l/y1k0/mvnViNW0qwohnte80h
	 bDLcGfwxq8XQrfXrRefyb/pkpia93j0RYqRlV711XLg17cqw4peihVP4JgaZcHMe3g
	 kElEv8ZYPy2ZfQKmTYkG7+UmYOlVhOEIVFaHTtpbGiiGh4K97YWyIQSZK7bZ+sdOFD
	 9BuqQSer9/eNg==
Date: Fri, 17 Apr 2026 13:37:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
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
Message-ID: <ad3c60a8-8346-44cb-927f-367dd0c39b1a@sirena.org.uk>
References: <20260416-selftests-mm-proc-mem-always-force-v1-1-3f5865153c67@kernel.org>
 <17ea54b2-d43f-49a9-9dd4-d2330a8daa92@kernel.org>
 <5357ef55-15c0-4c66-867d-898fa7f51414@sirena.org.uk>
 <aeE4XSuXY8RfphVs@kernel.org>
 <8260f624-7ed8-4766-8f80-0d0d4dbb5cb1@sirena.org.uk>
 <aeIonE2r89VdTJZt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WvM8zwGvYrTLpcPO"
Content-Disposition: inline
In-Reply-To: <aeIonE2r89VdTJZt@kernel.org>
X-Cookie: Uh-oh!!  I'm having TOO MUCH FUN!!


--WvM8zwGvYrTLpcPO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 17, 2026 at 03:33:32PM +0300, Mike Rapoport wrote:
> On Fri, Apr 17, 2026 at 12:24:25PM +0100, Mark Brown wrote:

> > >  {
> > > -	mem_fd = open("/proc/self/mem", O_RDWR);
> > > -	if (mem_fd < 0)
> > > -		ksft_exit_fail_msg("opening /proc/self/mem failed\n");

> > Yes, this is a preexisting bug in the test which I see there are more
> > instances of :(

> Do you mean that ksft_exit_fail_msg() should also print the test name and
> the actual failure message should be ksft_perror() before?

Oh, I hadn't read that closely enough - if bombing out of the entire
program it's not an issue.

--WvM8zwGvYrTLpcPO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmniKZkACgkQJNaLcl1U
h9CUXQf/b4HKtAKgUlKmw4k5mcM9h3raGw+Kp/OhcI3iGExLzD7Z6MM3OSS0aqf7
52XBXkTSFt3BVCT6G3dEW9nC7tc3cWzO1G4RKjk5wLX5x7Nu/Eeic2lcqqeOVawz
V2i6VT90YaC4MKf+x0ydPYntbYFIYSpSMCNo88kPQKrgkOiFb9jcy85eOabL9/62
iaK9S8M9Wk8MwiAHblPbEUPqU4+9xJWvkje1e+R5RdOYjSaCWgzs3c6SdaxaG4SR
M2lHD9WmhBl7Pp+OeUiOxU7jyMuWADBJQatPN7CL9bwkcXS+osuMKdb8Fw7GTqG7
FGHHo2Gy3yz9rI8i8hVdJNQqHtqrjw==
=Mej+
-----END PGP SIGNATURE-----

--WvM8zwGvYrTLpcPO--
