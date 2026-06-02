Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C25214A8B;
	Tue,  2 Jun 2026 17:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780420084; cv=none; b=iqdJbwqKcV7KLx1k/UuKW/AtE2CdVLXBLMnDTTi2j+8QkRtzc/b/1xqk9QxEEyFY5+g+MtNXw/LL9u1CrA7Zia+9RgNJOY/9K77S4V6bgxlAKAUEkHywg1Iy1xIsKpVGc4e4e457tvZs5TW4NmkuD2XUSwZMwYMz6EZaglCoM7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780420084; c=relaxed/simple;
	bh=b8LTMPtD6iMaCtrav5r1PshHxfBpfMNj6x7jHVxP9po=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LcdMQ+bivhKjXD3RsaWGBWJ+SE4XG244o7ISdMmE716WtZOGV+UmOLUC3ME3N5mne0UqLLRiZ15bDrJQGuvdtucAJcH14HxzRT6+6M/k1E4V11mhHVdY4BVVi0DFU5zzuSFDl2EgJS+IXY3sOdmoJ7cBKgzvpsV2Ga7FfyWTiWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NNDMgpuF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NNDMgpuF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 791A11F00893;
	Tue,  2 Jun 2026 17:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780420082;
	bh=NmTjsdtcsEWPtZ1rK4J/ssqszpbeEyMBBb9pIGb/JA8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=NNDMgpuFP58qv/uVLIlfI9sarPKbDaMhNRa4+PTfF0jz2aBQ4vxq6RfKqtJMHoIhE
	 qLChX5g0Ye1ZQtg96r/5oiv/9NKx+46rj/aVYt2qb969aBXxarsT1YEgPLk61nJ4nZ
	 qEHsaiY1UnfX/5r+OJti+YOj2QJi8D/XaDg/tIL5Cq9ZCunJHgKp8wNDdl1MrEuo3y
	 P92T+5NR2DwtdKI7yMSIV/efPMaBWt0vCAFbFk+TzAplxfMEZKEvM18K3jtouq5tys
	 aoPh7teJRj4ofGeNoIeRu0iOoSAAySOpqVW7AzckZVbyPFhEIhZjFVxK3fB5XVa0Ig
	 pAIgKoE41STXQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org,  rppt@kernel.org,  shuah@kernel.org,
  akpm@linux-foundation.org,  linux-mm@kvack.org,
  skhan@linuxfoundation.org,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org,  corbet@lwn.net,  dmatlack@google.com,
  kexec@lists.infradead.org,  pratyush@kernel.org,  skhawaja@google.com,
  graf@amazon.com
Subject: Re: [PATCH v5 10/13] liveupdate: Remove limit on the number of
 files per session
In-Reply-To: <20260602031717.197696-11-pasha.tatashin@soleen.com> (Pasha
	Tatashin's message of "Tue, 2 Jun 2026 03:17:14 +0000")
References: <20260602031717.197696-1-pasha.tatashin@soleen.com>
	<20260602031717.197696-11-pasha.tatashin@soleen.com>
Date: Tue, 02 Jun 2026 19:07:59 +0200
Message-ID: <2vxzo6hsdg5s.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Jun 02 2026, Pasha Tatashin wrote:

> To remove the fixed limit on the number of preserved files per session,
> transition the file metadata serialization from a single contiguous
> memory block to a chain of linked blocks.
>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav
