Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A39E14A619
	for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 06:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792046945; cv=none; b=sR7+a3BTOL2cTblIfP06V2t/N5ubxd6W4SgfoScRIjGYU+py0D3MeJYUBDRPr5OmgpXW4oKFJz/+ul6GocaV68073XkqKQ2pwnmw52ci7qre8F1L/OSVtaVKmYTPUf29RgR+jCPqdWefquSx446X+gZ9tC5HpjorpDsIBRUmQYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792046945; c=relaxed/simple;
	bh=jH94vNlTdIwm6jZHBQQNa3v+vblk6T61f2PK0+CjxmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mx5OlE6dGet4wsPwHYAz+X8nNIgCpHyU8QzhoGwB38FVmfSfhh+DEi4qtOHiWuZ3GKWeR29hJeDHEYWWOHCdKqMD8LLDwh9SXil6Grsik8ChAzplLXdms/2+Xo6mj4FvyWywYwc+9Ybj2QA3VgEtkAefxnfHNuR0DMpjupyyeuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=voza9Lwq; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="voza9Lwq"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25E241516;
	Wed, 14 Oct 2026 23:48:59 -0700 (PDT)
Received: from [10.164.19.84] (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BA4CA3F871;
	Wed, 14 Oct 2026 23:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792046942; bh=jH94vNlTdIwm6jZHBQQNa3v+vblk6T61f2PK0+CjxmQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=voza9Lwq+doL2sr4Tc3HIACuSBabUN4ErHuDJ7uOkRp3uPTjRLxSkIB9sWKSBblzJ
	 6r/2gVeyJuu9+U/yX8cS5fPBAWnjxOFpGv7VGj1fIUpsmoflzsy0Q7WuR/S+pqd6WF
	 lHRLY2D/OEzmbbHXY3f5tvtTMtBUCD2FwDR5UPW4=
Message-ID: <f09eedd2-3a82-4184-a456-6d8a3b0f4139@arm.com>
Date: Thu, 15 Oct 2026 12:18:58 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: test mremap DONTUNMAP with locked memory
To: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>, akpm@linux-foundation.org,
 david@kernel.org, shuah@kernel.org
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org
References: <20261014191803.196515-1-ampr.mhd@gmail.com>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <20261014191803.196515-1-ampr.mhd@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/15/26 12:48 AM, Muhammad Mahdi Amirpour wrote:
> Check that a partial MREMAP_DONTUNMAP operation on mlocked memory
> preserves locked-memory accounting and that unmapping both mappings
> returns VmLck to its original value.
> 
> This tests for a locked_vm accounting leak after a partial remap.
> 
> Signed-off-by: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
> ---

There's already a patch in mm-unstable that adds a test for mlock
accounting [1]. It covers the partial mremap with MREMAP_DONTUNMAP case
as well.

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?id=35524c870053cb28bb056fb17e715ebebec17229

