Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219700;
	b=eD3PXSPtiweqqOsrU16LHNmYwOyNswBItXOdhzaEYjMLTtjnTfQxTlPWxEimPXvKVxbv
	 PkC8rcIqr0bSM8ZRMaqllp5UudCCX/kHU0QPn1t6c1sIjcwvqYIwq5ZcjNJT3wN/OM/v4
	 rkrA02qgi//STutOTVfYDvSqM5cVFvN+P0qMmoE1/ty8bwm9QI2EZhlwFh5KgVEG02ZG7
	 N40In6mSVZGxfCYZuEnTJBsDp0+Ejd/iz0XIeWcRaOs1f580a1rUzDmyR17NnP+HW757R
	 vSCQybZjUZA7FfxFNCL6mmQM/W9MDWdBa+YbpglO/ZjwAhMQM15oP6saBELm2QYrdJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219700;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=d9Mh7zcU2qVqN6q3YyF1TgdqL89OnrMKzQIrIs171OY=;
	b=f7TfXNUu/nAPSdugz4Q94jMY4qBXK3oHjfCMoDLDYT15i5GL3oNuSc/QvpYFqouHkupK
	 Kz5W13KCMrX3WvuQE/zyU+PiuAHL6ZGmhBu4iAwGkrIbFBYn1JKjXD2/oIcz2/bIcIMPB
	 oWmxixLZMs9cCWeaTzgBHs8Z0+9J2bRgPWWLm8UtNvkVrqpyD0eZDvpToGozzuQru5mzp
	 XxMjdlr+Gbjn7BfGF2IV3Ay47/n9LENP8d7/vzKRp42JsNscxAca9gzcQj75R2bSD0GYT
	 P0zkGqvHCPBh6XCaczalWxQIIU4OPYpFWEWFZw88s9FvJmFFVaGdapBOkpr05hYzK9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=UYTbY79Z;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9270F606A31C;
	Mon,  9 Nov 2026 10:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9270F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=UYTbY79Z
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B4CD1576;
	Mon,  9 Nov 2026 02:21:34 -0800 (PST)
Received: from [10.211.55.3] (unknown [10.57.89.2])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 130803FA1F;
	Mon,  9 Nov 2026 02:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794219697; bh=PSQikwJy94/T+7OO4mA3Xf6CT740QCSmYym6UYgaEEU=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=UYTbY79ZupocCRvr6Y47AQpUaDGa6hSOcnG1TkMa5py3ijSTzJxjLTLBKJQMK3q1e
	 OSiH5WiSYACD+K8PU75soaQDYstCPHGTExvLoBt+QGF0M7xXALgjSPilh79I2xwqtd
	 nagDQ8xXiGECC2Wgmc/wMTMsE1cf3kC/EIzL/szk=
Message-ID: <08ba3b64-fcc3-47c2-8c04-ad00d54da8c1@arm.com>
Date: Mon, 9 Nov 2026 10:21:22 +0000
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v5 1/2] selftests/resctrl: Implement cl_flush() and sb()
 for aarch64
From: Ben Horgan <ben.horgan@arm.com>
To: Reinette Chatre <reinette.chatre@intel.com>,
 Richard Cheng <icheng@nvidia.com>
Cc: tony.luck@intel.com, x86@kernel.org, shuah@kernel.org,
 fenghuay@nvidia.com, Dave.Martin@arm.com, james.morse@arm.com,
 babu.moger@amd.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kaihengf@nvidia.com, kobak@nvidia.com,
 newtonl@nvidia.com, kristinc@nvidia.com
References: <20261012074729.40042-1-icheng@nvidia.com>
 <20261012074729.40042-2-icheng@nvidia.com>
 <847af89d-7b79-44b4-8273-243dfb51ef5e@arm.com>
 <9cccea63-397c-4913-95bc-eed38f0ebd66@arm.com> <aurOz7iGKInyjddW@MWDK4CY14F>
 <b94aa5e5-a4ab-4b61-a864-d10ff1ff2b63@arm.com> <auxM9hVAgp61Qbgv@MWDK4CY14F>
 <c58c397e-26e4-4866-be80-59d9bd861654@arm.com>
 <808923a4-0a6e-4d8f-8ace-d3573aa125e8@intel.com>
 <89549a38-4764-466b-b66e-98bab801fefc@arm.com>
Content-Language: en-US
In-Reply-To: <89549a38-4764-466b-b66e-98bab801fefc@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 14/11/2026 03:16, Ben Horgan wrote:
> Hi Reinette and Richard,
> 
Apologies for the time travelling.

Ben
