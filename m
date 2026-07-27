Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62393F8EB9;
	Mon, 27 Jul 2026 15:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785164527; cv=none; b=aR7Q24ML15/qhpnz4Sq5UgIXjTxxvj75oBkB8Y/r58CsCVMXlN7+2lkzrIWOaD5e1fXf1Cj8jbwOyiiW22aTtOw93h8WwzDa2GM1lku1ny2/sfGM5J8wRWgCBnmUih300nDMXT3kXJoBbSstXVMbK8cGh1G2kiWMKhpGpvwNv14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785164527; c=relaxed/simple;
	bh=oa+xnWXQte85S8sg3JlQydLKmJkJsAXF91qSfXRDVh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cVJtcBvuUZCuAF1tEHVfXvTppsTP5SZ+zuM6s4eJ4/drjAGCaI9Y0JvCaFQh6+pdKujluMZIXV2gnoRhMUZ/3TxWNxMRRyUdTIx9ZecG+m7PdZbWTY9LTLKL6m4gk2uBHOK+41FMe7bgII8DWIz1wQjcfkyddTjqtardoGnj8Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SVK5cFAJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SVK5cFAJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927861F00A3A;
	Mon, 27 Jul 2026 15:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785164526;
	bh=hizOCaxPPgSKLQsB+dkyTXWPquqyDTeCgsWXeGjHDZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SVK5cFAJep91T6f9/fnfaT5XPxLJiGW3u9UlxCYH6W2VKNFA4Ioqwr+9W5veJlWY8
	 hd3HkfGi70hKDQrTF4sRMYgRWDbB8o6plzCF3sMEuop6BJLKWXSjufDC847yJly6f8
	 zOsb1qWUzy2qyfNXJ74aUNHTyVV+xzCsUQF7AXKuVsR0QZs2a+xxPO+3FBPR5vuau+
	 /f97aGzgYEEfoTIJjZS0jpAFbf+6bEQJK6V247S40i4Nb1zpxPLJ+eY8KVdjLj8TvL
	 JMcVo/MxH47SDfrffMggwlT91AjKCvrqssyaHouHLotZnO0n5T0FqjHE+L4aZcYRv2
	 hgUMRUJf93Asw==
Date: Mon, 27 Jul 2026 16:02:01 +0100
From: Simon Horman <horms@kernel.org>
To: Xin Xie <xiexinet@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com,
	wsa+renesas@sang-engineering.com, jie.luo@oss.qualcomm.com,
	shuah@kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, fmancera@suse.de,
	bigeasy@linutronix.de, fmaurer@redhat.com, luka.gejak@linux.dev
Subject: Re: [PATCH net-next v4 1/4] net: hsr: add PRP interlink (RedBox)
 datapath and duplicate discard
Message-ID: <20260727150201.GP418547@horms.kernel.org>
References: <20260717201457.54-2-xiexinet@gmail.com>
 <20260724131230.679892-1-horms@kernel.org>
 <cc09e554-45fa-4b75-8937-7da15432a886@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc09e554-45fa-4b75-8937-7da15432a886@gmail.com>

On Fri, Jul 24, 2026 at 11:27:57PM +0200, Xin Xie wrote:
> On Fri, 24 Jul 2026 14:12:30 +0100 Simon Horman wrote:
> > [Severity: High]
> > ... does modifying the MAC header directly in hsr_xmit() corrupt
> > shared packet data? [...]
> > Should the skb be unshared before making these direct modifications?
> 
> I checked this against the v4 base and the series diff.
> 
> The shared-data write is real. hsr_xmit() writes
> eth_hdr(skb)->h_source in place - the slave-address substitution
> for master-originated frames, and the macaddress_redbox
> substitution for the interlink port - on skbs that can be clones.
> Multiple consumers can share the same packet data while needing
> different source addresses: a PRP LAN broadcast or multicast can be
> delivered to the master (source rewritten via
> hsr_addr_subst_source()) and forwarded to the interlink (rewritten
> to macaddress_redbox) from the same underlying buffer.
> 
> Two scope facts. This is pre-existing HSR RedBox code, present
> since v6.11: hsr_xmit() itself is untouched by the series (patch
> 1/4's hsr_forward.c changes sit below it and do not modify its
> body), and the series' only h_source-adjacent change moves an
> existing ether_addr_copy() a few lines earlier in
> hsr_dev_finalize(), where no skb is involved. But the series does
> make the existing interlink path reachable for PRP.
> 
> I will handle this as an independent fix for the existing HSR/PRP
> code, posted separately for net with its own Fixes: tag - not
> folded into this feature series.
> 
> Would you like the feature series to wait for that fix, or may v4
> proceed while it is reviewed separately?

TL;DR: Yes, I think this patchset can proceed and fixes for
       pre-existing issues can be addressed separately.

Thanks for the detailed feedback above, and likewise on patch 3/4.
It is much appreciated.

My view is that in the age of AI-generated review there is a risk that
making corrections pre-existing problems a pre-requisite risks perpetual
scope increase. So I think that that unless a pre-existing bug is made
materially worse, or fundamentally prevents a patch from reaching it's
goals, then fixing the pre-existing bug can be considered as follow-up.

Of course, drawing that line is a subjective matter.  But it seems to me
that the pre-existing issues flagged both here and in the review I
forwarded for 3/4 can be treated as follow-up.

> (The hsr_create_tagged_frame() side question overlaps the third
> finding in your 3/4 mail; it is answered there.)
