Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8982D781E;
	Fri,  3 Apr 2026 18:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775241128; cv=none; b=CrbJw1nGT4tHqBRb5PidC/rQD+9wtTMyausgssL8QX44x3SrxTfBsla7CY+oAPEioPF/f6g+vSZ2UVlgHiPRGq5DtWUGASwlnv2vatajgXbGOuDumfnP8msdW7j+Lym7GDkD/JVw3pjVOg2HXxVm5+GF7kjkNkk/AIKsmqMl1+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775241128; c=relaxed/simple;
	bh=TvVC+nwUPJvPfGBp3UoDRWVZctwPeVAHVfxSvR91lDg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=K67P6dWcUrxxf7QPA+tbmoiar256vlh62z3XAao/ACYQ8KzgOKVZYqEGklEICNML0GiVOk/jFj8Mp8axBpgb7HX5EAsGOGOcgMc9ecYdhRxbMHAE/k4R1JNsZBSCPK5ZPMW30YfevjGaVxFi/Pjat1Nxs6mfVWpjv42wKbCMvG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UPoCO5jm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UPoCO5jm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94DBAC4CEF7;
	Fri,  3 Apr 2026 18:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775241127;
	bh=TvVC+nwUPJvPfGBp3UoDRWVZctwPeVAHVfxSvR91lDg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UPoCO5jm3FOOHMaZv5E407upgpxENY+rmKh42fDTdDe1Z4+7ItgYWs3eU+5Nw5ZGh
	 2LOhA8vpaoNz5JqDcrqykaE6lKC9J+cUa0oROkuT/CfPnr/+cAoKK8Aag4txVJG7Y5
	 xJk3kp0QBZnle/Hb2VnOb4N9eVMrDrJyi7ledMTLN4YezVKisZMSpSaXGlwepsrt7s
	 BEEukhsGVVAA73c9XmZlg19IOMSnVuyh7U8Nn4zm3K0MwQrekeZTLCU7T9UBuXjJkM
	 KaYu59syDU5GhjJf25Bu8fYl1Hexh35N98fYRDCfiFwAMLblZ3WgSW+EvpHtyvFovs
	 RDcLGCSPyBENg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org,  rppt@kernel.org,  shuah@kernel.org,
  akpm@linux-foundation.org,  linux-mm@kvack.org,
  linux-kernel@vger.kernel.org,  dmatlack@google.com,  pratyush@kernel.org,
  skhawaja@google.com
Subject: Re: [PATCH v4 2/3] memfd: implement get_id for memfd_luo
In-Reply-To: <20260326163943.574070-3-pasha.tatashin@soleen.com> (Pasha
	Tatashin's message of "Thu, 26 Mar 2026 16:39:42 +0000")
References: <20260326163943.574070-1-pasha.tatashin@soleen.com>
	<20260326163943.574070-3-pasha.tatashin@soleen.com>
Date: Fri, 03 Apr 2026 18:32:03 +0000
Message-ID: <2vxzpl4fc2u4.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Mar 26 2026, Pasha Tatashin wrote:

> Memfds are identified by their underlying inode. Implement get_id
> for memfd_luo to return the inode pointer. This prevents the same
> memfd from being managed twice by LUO if the same inode is pointed
> by multiple file objects.
>
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav
