Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74011319852;
	Mon, 15 Jun 2026 21:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781560680; cv=none; b=egBj2TAc+gr+ZXeT/MZfL8O/4i7HbfxOetuY76c+4xsMeAi2ofklZm6bj3JjsU6uo6edsd438vjsiW2g9T+J1LcLtDlv9jv2qkiBWQdvgswMobuZ0euWSNYoIdTokRdwMp7mT1ugZFwtI6+AgrA4lSUJuV2186Y/D/qavMKd3t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781560680; c=relaxed/simple;
	bh=9kivlZtZbuO0VOVybcXe6QAws9Mmpg58aOrzAFKx2q4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bRlqGfvVw8j+NiL6HVx9REwOnke52BElw9+mehh+Nn7Ifx+3yPNLW7tVGAj59UZpw1ePfmoctPZX2FCYnvoBewEWJ8L0phuGETwZZU28o5L1F7KZQO/3gMaYFhHR36DYxKeCZwkV5HyTvywl4LuYJ88o2sQdgH3n8K1GEX3lj4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dzy+gkH2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dzy+gkH2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F16521F000E9;
	Mon, 15 Jun 2026 21:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781560679;
	bh=ZybuVlKws8hgVhXg4VsJD/g+orod/d6HM3+PwcKNxVk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=dzy+gkH2/qCX8JT+F7lkPuVsTM3L6UsLZ8D86wt4w/t6ROOeQ11iGwlemG01ax3k7
	 I3lQv0qdtOM1xOIsd0YpO4wl5CvwzYMNHZSErzo2fTighoGj5SutfOdQTlr56nMSQ6
	 K+dfaC1nJCANxJPr33HAAvJ5VnWXGtjXlvRLS1iQNDran5OiR1w0NBBg8EfQCAckBt
	 rbMdrrfKi6CkZO6yfDSmwrWLnPmUTQ2m8VUg4Tq6aajwW45eYznRqiZ7gIK68YKq8j
	 CTusxYMFdNGCTFdoRamtFeGmiXeZb+n3ZrL3WA535cracAT9NMx4hhvzlCuRLPgGkq
	 ej+6PFkFapxTw==
Date: Mon, 15 Jun 2026 14:57:57 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Donald Hunter <donald.hunter@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Gerd Hoffmann <kraxel@redhat.com>, Vivek Kasireddy
 <vivek.kasireddy@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Shuah Khan
 <shuah@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org,
 sdf@fomichev.me, razor@blackwall.org, daniel@iogearbox.net,
 almasrymina@google.com, matttbe@kernel.org, skhawaja@google.com,
 dw@davidwei.uk, Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v3 2/4] udmabuf: emit one sg entry per pinned
 folio
Message-ID: <20260615145757.0b2ddcf3@kernel.org>
In-Reply-To: <20260612-tcpdm-large-niovs-v3-2-a3b693e76fcb@meta.com>
References: <20260612-tcpdm-large-niovs-v3-0-a3b693e76fcb@meta.com>
	<20260612-tcpdm-large-niovs-v3-2-a3b693e76fcb@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 12 Jun 2026 09:25:58 -0700 Bobby Eshleman wrote:
> dma_map_sgtable() does not always merge contiguous pages for us, so we
> do this internally before exporting.
> 
> Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
> ---
>  drivers/dma-buf/udmabuf.c 

This will need at the very least an ack from DMABUF maintainers,
so it's a bit late to consider it for 7.2
-- 
pw-bot: defer
