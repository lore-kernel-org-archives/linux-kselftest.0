Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCC93BE62B
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 09:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785142996; cv=none; b=YifbXTWgh0bHGqAg21EuCj/kDX57IDh9rWn02NKUsa1DaBXiZK4NqH+/PenWYF9U5mrOoZ+OFVQ2qTOzivRWWt0gHlETxzaP+7cI71Hk0P159IXS/zmQnRr5SoMpSlRaZp338QRfZt9DDH8pdxcvGxra/kcDd4Pjy7P0JaD1RmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785142996; c=relaxed/simple;
	bh=kTDH5S4ysmo2sFaieTu2UjAmwNg8TwOXckYezAXHhh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jZHaVoUkR5HeGxl3G+Hp5YsrgG3D9NUNA2QkPfXnjV/cK6kDWdvAxHp+iKaykHeZHk6QcH+sSRnfzxicB/1lxi8e5zxpabZoG9xiitp9Y59fYkgru7BqGn4Es+BcR2tkLGUWv5nvnyjDMHbCViJR2Hibxn0bDq4ZIq61HUkHniw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b=b3GviCnP; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b="b3GviCnP"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49555a0e68bso12084655e9.2
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 02:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1785142993; x=1785747793; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=edzEg2J/oLqzfs9TMR6atfH/lM7LkpfPbZs2uM8pJC4=;
        b=b3GviCnPq9i1aD7Y5y7bzKgg6il0W8m9XaPJQ4I12+i4aM5U6hRMuNxR65SpN7uUHQ
         PWnxjTKHglMT3cV+qGust9WX/AL2ARb8BKzITWhH8Vh121IvbLyE3dAKYnDNm9GGZ1pe
         6hJ5U102tnuCTKYGutx5K+IuXtT/NE+AL8XrT0tWppE8Z0LndTSrSPMSw3QrO5E3CDOH
         Ypzn5IVWR0x3oRtAyqN2N2ESOCYQH0oi8Ggm1mTvLI7vtBxBg0w2FqiCifuHZni5/e57
         BT227eFMxD0Uq4pu2DXaipPgvWnq23gJCyk2ERmhKXNtOcpYOSKuQyH6cK2zDOMIDjI+
         n0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785142993; x=1785747793;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=edzEg2J/oLqzfs9TMR6atfH/lM7LkpfPbZs2uM8pJC4=;
        b=VB2WgE274mZACbnpf6fTgwpyD9MT1JCivwSdzE8sGfOirlD7DVYXYBAXoP+xemr+NL
         uk3OeopYuPbM0JyCjAZx3bvt+Hy81t+IJR6FPJBi7NncCIXuaQpX2ugsUxhY5npiIjfC
         pjXSa08A6E6bdtWaN3ibDhlEeXg+MBx0RGcoJKo07YCou7MTvVEyvKYwO3xHe3yUIhQq
         u/22pu/lclnyvghSqJLjpjT0kDy0MFIuFBFouN95PNIsxxnIsmpYD/sO0hkRq5xtid+U
         XRB99qITHttPRCghHx7Hr1h/z02Z5JpXVr+rzrM7/E3VqcW+bwA2ugXhN/yrbwI8CU8f
         9ROA==
X-Forwarded-Encrypted: i=1; AHgh+RoFOhdzKUD9qusfrtn1lX5t/k3rSksblfz8k9smBq0p+icqqmhbtYiM0TRDSUzR2yfb/vreddD75Pl00+fW8vc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa63xn0MdN8TfyJTR8mXaMyQxVCe2eTBj3LVuzdyqdAMusWp0S
	UN+e9N2csmVYx2q3M4VUJwL4s14EIFFqTJGw+VLUDzbxBZU6gZ7yBOckL+l4Ma2mcUg=
X-Gm-Gg: AR+sD11DmpTtLqWpjiiEDvcy414xcmntEtMbxjJTNku+pU3dZyg7c99XDqy3d+xDvMb
	u+jXc+WB+s8BNybDE6owAUUWhm5bMB/7bLHFvsqyz6Y7L6ArvM0SNn+PfRCOr1fxPgNWpOcOszA
	mcsRFUqH4k8dvVI5KssVQC4+lBialEnIS9B8OoQyry00rffKCQDMWLf3k0dWppzjul8edhb9EQg
	4X9RyrW91QiE4W8HPD2Lzdvkw4NF9x1Cwzmn7iH0yDeuDhBI63bVs5azquIGFKxFckzCIeCDv3u
	Eb7Gwda8CmqKJBvvOrihAF5ZZrBo5fgtLS3WYgWiep2HFcJ6Qf7z351C+/qCD+vC321k1H/oDlO
	AA3U0x5jhGRnjwz+uB/sWC1miFZptVA1Ouah+CjQgkFHOUzvtaLO+63o6hrZUl7ofVnmWev2aZg
	==
X-Received: by 2002:a05:600c:3113:b0:493:c8f7:3631 with SMTP id 5b1f17b1804b1-496b570dacdmr90046155e9.22.1785142992910;
        Mon, 27 Jul 2026 02:03:12 -0700 (PDT)
Received: from localhost ([109.160.73.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4ed5f93sm333309535e9.1.2026.07.27.02.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:03:11 -0700 (PDT)
Date: Mon, 27 Jul 2026 12:03:06 +0300
From: Nikolay Aleksandrov <razor@blackwall.org>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	linux-kselftest@vger.kernel.org, sdf@fomichev.me,
	daniel@iogearbox.net, almasrymina@google.com, matttbe@kernel.org,
	skhawaja@google.com, dw@davidwei.uk, Joe Damato <joe@dama.to>,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v6 2/3] selftests/net: ncdevmem: add -b option
 to set rx-page-size on bind
Message-ID: <amceyvCsHb_B1-Of@penguin>
References: <20260724-tcpdm-large-niovs-v6-0-7975f62cdfbb@meta.com>
 <20260724-tcpdm-large-niovs-v6-2-7975f62cdfbb@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-tcpdm-large-niovs-v6-2-7975f62cdfbb@meta.com>

On Fri, Jul 24, 2026 at 02:21:16PM -0700, Bobby Eshleman wrote:
> From: Bobby Eshleman <bobbyeshleman@meta.com>
> 
> Add -b <bytes> to request a non-default niov size via
> NETDEV_A_DMABUF_RX_PAGE_SIZE. When the value exceeds PAGE_SIZE,
> udmabuf_alloc() switches to an MFD_HUGETLB-backed memfd so each 2 MB
> hugepage produces one naturally-aligned sg entry.
> 
> Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
> Acked-by: Stanislav Fomichev <sdf@fomichev.me>
> ---
>  tools/testing/selftests/drivers/net/hw/ncdevmem.c | 36 +++++++++++++++++++++--
>  1 file changed, 33 insertions(+), 3 deletions(-)
> 
 
Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>
