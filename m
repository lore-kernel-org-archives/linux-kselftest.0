Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C868772617;
	Thu,  4 Jun 2026 22:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780612834; cv=none; b=Rg2OzADKKwxKnJ9LT04YgQR5mGxSZiuDpDci5K75RP7NnTa1yRUctc1B/4rme/W7wFdhB8UE785gAaxIOK9/neI4oB0w1o5mZs6msnPRyqg/EOWVzl/rF/UVPSMYP/CTeeiQn9h7vNV70AvM8tWNvaMiRXYGi3ifNGszcu5ajOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780612834; c=relaxed/simple;
	bh=oJysmof0Pd2YptQ6KHl2YdNapmY78mNRfypO9pdHXQM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=VQvVZJ1pFpUMo+0BovT0AJGSZo1YX1K9h1gSTHnDkDFSiwKR7QEBFQq1SnUK0czLQ1XOCcX+43SBeZzSPWcWr32wkgnJ08LrSNcPPwirG53jW0ytb1k+lz/vzkfvGRP9TTkrYX6LoGyGnRJwyShTyD+qvXWGZb/pqHdyPzD8uQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JjQkOmxZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JjQkOmxZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA00C1F00893;
	Thu,  4 Jun 2026 22:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780612833;
	bh=pcf+/TQHSC1lT4PMAPLFzMjabSqrHnTT7tT2IMtCJBI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=JjQkOmxZJM/3c7vpeiNFCYBI3RPfO6e2JyqEIQmTb9vf6Lj9nW3Mr6jVox9VLHe+N
	 wk4saK2/au2ta8MS77MYbw8fgxK0J+yYlqizalZODqNVhD0JxZ/1tQVFAQHrsl/88i
	 CdxkclQQVTniXlQhFor/J2Eb2pFmVF8Oc27oANcjer7nbet69bNRIIaDZSh19TglAr
	 VDmjQUw6AkAMDPC5W17fp6kFvThRzNEZgb4ayUgUHBY4VIg7QFUIDGrtmFEwRShkj0
	 6hEwugdka3lCEveyulV6YpWndGBtvItmEwutPNoLy8xYj4Iv2f99WO/y8HS0UDI5iV
	 zgyQTnBRTUKcg==
Date: Thu, 4 Jun 2026 16:40:31 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Richard Patel <ripatel@wii.dev>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>, 
    Charlie Jenkins <charlie@rivosinc.com>, Shuah Khan <shuah@kernel.org>, 
    linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: cfi: reject unknown flags in PR_SET_CFI
In-Reply-To: <20260518183918.322545-1-ripatel@wii.dev>
Message-ID: <3f2d4628-a95d-89c3-2fd7-3e1a407d698a@kernel.org>
References: <20260518183918.322545-1-ripatel@wii.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi,

On Mon, 18 May 2026, Richard Patel wrote:

> prctl(PR_SET_CFI,PR_CFI_BRANCH_LANDING_PADS) silently ignored
> unknown control values. Only PR_CFI_{ENABLE,DISABLE,LOCK} should
> be permitted.
<
> This is a uABI breaking change (fails previously accepted bits
> with EINVAL).

Thanks for the patch.  However, I'm not convinced that this actually 
breaks anything.  The behavior of the interface changes when unknown flags 
are specified, but I'm not aware of anything that relies on this specific 
behavior.

Does that match your understanding?


- Paul

