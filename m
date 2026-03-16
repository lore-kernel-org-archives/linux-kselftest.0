Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0551D95A3;
	Mon, 16 Mar 2026 13:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773668859; cv=none; b=BhTQzok0ex08gOo+mSpcfEzXwieAA4iq0MDYUFL5vbwboWS5tEQitomliX+UpybAsc2gcnhbZjxqK0tnHQAL4iPgscvFEzMdyHR/bl4oIY3xc9aP4DFoscsgjSH9pHL/ef5mqJStqaq/0YHkVS/+JnvKwfwnHyuH6F3AIW0nocI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773668859; c=relaxed/simple;
	bh=kUaw/ApXBx3G5X3U60ZTrc00zWa/LVVe3F5FnEeU/3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JCE0AStyrmC/Y7IQ2qUxrUDWmQdAURqQqIyRvitw7yswd1HCE+DA4q3Q46bZMfiXIJU84YBPzV/7cdZ2J5KyFyC+cjxBeVZYnsuPnVtKvTg4VheyHnRELAWzKVnNtShafXQQETgCmpzxug61zBffQw8plhaZfbEQy2glnsZFPD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=hNvbX3li; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="hNvbX3li"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uGSE9d/MDgSUHB7IOyMM2Jrkqp8fufTF8CqpO2g6g2c=; b=hNvbX3lissU2Sh8U0MB52YkS6h
	VwtVXhWP7Si+x2TgVDzsn3CTWEsTNyAsA3zZq0ssPCTJSTNwxpsCiVV/q0jP4wAbOSCfqZvRMol7F
	GSckkpljJwbpegHXvl/JHF2feQFjA/Xuh1o4WTWVs6ugZtS5ulW6Pfm9tzfzqeH79IQ0Jo9GmMRfO
	CxRGI6tv0SBFFMux7RYAVOOtsqYCDJleZjXGjZMQ4WZ8YIFkAPS7DO/rA99KR8EYUxPRvIGUjVCxd
	gJG1qiKVuzu2rcBFveZ0A3iBjF4NFg4/zE9hDUY2vkkjKQlze4++FVmpumfJZ+fZ5NAH2mNvk2xEW
	fQfaL5FA==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1w28I6-0029i2-6h; Mon, 16 Mar 2026 13:47:29 +0000
Date: Mon, 16 Mar 2026 06:47:23 -0700
From: Breno Leitao <leitao@debian.org>
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	kernel-team@meta.com
Subject: Re: [PATCH] selftests/mm: add THP sysfs interface test
Message-ID: <abgJtJYQsGMPsTHr@gmail.com>
References: <20260309-thp_selftest_v2-v1-1-a00cef41da44@debian.org>
 <9cb63c24-eaff-4954-97d5-2a422a0401fc@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9cb63c24-eaff-4954-97d5-2a422a0401fc@lucifer.local>
X-Debian-User: leitao

On Mon, Mar 16, 2026 at 12:55:13PM +0000, Lorenzo Stoakes (Oracle) wrote:
> On Mon, Mar 09, 2026 at 05:00:34AM -0700, Breno Leitao wrote:
> > Add a shell-based selftest that exercises the full set of THP sysfs
> > knobs: enabled (global and per-size anon), defrag, use_zero_page,
> > hpage_pmd_size, shmem_enabled (global and per-size), shrink_underused,
> > khugepaged/ tunables, and per-size stats files.
> >
> > Each writable knob is tested for valid writes, invalid-input rejection,
> > idempotent writes, and mode transitions where applicable. All original
> > values are saved before testing and restored afterwards.
> >
> > The test uses the kselftest KTAP framework (ktap_helpers.sh) for
> > structured TAP 13 output, making results parseable by the kselftest
> > harness. The test plan is printed at the end since the number of test
> > points is dynamic (depends on available hugepage sizes and sysfs files).
> >
> > This is particularly useful for validating the refactoring of
> > enabled_store() and anon_enabled_store() to use sysfs_match_string()
> > and the new change_enabled()/change_anon_orders() helpers.
> >
> > Signed-off-by: Breno Leitao <leitao@debian.org>
> 
> The test is broken locally for me, returning error code 127.
> 
> I do appreciate the effort here, so I'm sorry to push back negatively, but I
> feel a bash script here is pretty janky, and frankly if any of these interfaces
> were as broken as this it'd be a major failure that would surely get picked up
> far sooner elsewhere.
> 
> So while I think this might be useful as a local test for your sysfs interface
> changes, I don't think this is really suited to the mm selftests.

That is totally fine. This test is what I have been using to test the
changes, and I decide to share it in case someone find it useful.

Let's drop it.
