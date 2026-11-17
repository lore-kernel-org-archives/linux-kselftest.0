Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910366;
	b=CFldAV2sqQ1/L7ZxBRzeUXnYInxANiZ8HgJWFNsCGxBndfmeafvr6Fg2GP1hdshcmc+Z
	 88YZuTolUzjzaadXjAAs8iK5GnYd66j7K5BwEg3NinB0t+ry6P3S/g23deU8q+etoA4ez
	 QwhZfHGavLq1xFmZh87pZBTnpvLcS358IunDUnLY1DTXKD8Ok0DoLhIWwqgQNs4E1WoOZ
	 CoufpCUtqOuKxjsxJTuhYOOufH95jbU0gJdJiCMmmkX0L0vNO+CNpKaLbDzCoqgTVMww2
	 iAZr9HN+ZgSbgfV37S4p6K2SI/YRdhKknMYAPVG8SA+DzkPNTkyn0gjFa4HR/b4sCkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910366;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=D3OLF8gB3qg7oq3Zq1DXdpp9l0JzH5utHq9bO6sDOHM=;
	b=uuOF5GhySDZfCAKjKjCsgFFu1R4uHKOZwjH8q/jneUV39GbjAgKjiWqiJ49AMiFEr7rv
	 /ENlNWHoDuzQgvqA5gJqL0eq5oY44nBK7erVjzfWIXZ2K0v3yPmHQrKoNePQ1faP+PZuc
	 BeBdhhzdA0xfE/7nj3+3XnQ9c3Y26zLo6/3vlI/qHmBL+/Wbo4d8o6g4dCBZdqMMJQcbW
	 1ft+T2YLgpavksvf5zWuECQzMEDuQzdbY//tQmZNfkd+JnNnKL9ULXOsmle06HD0ycaUO
	 vQCuzAcseKLl88NuQWnFD0wmbOjNjDCBga6UWdHKVHRg4jV8z/wTo+RaFdVkq6MEbqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=OQchZGWj;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75C6E606A330;
	Tue, 17 Nov 2026 10:12:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75C6E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=OQchZGWj
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C53A5339;
	Tue, 17 Nov 2026 02:12:41 -0800 (PST)
Received: from [10.164.19.84] (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ADD5E3F763;
	Tue, 17 Nov 2026 02:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794910364; bh=ntG9brhhod790MDNwXy0CRXHhBdlremMwhEoGBmXYPE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OQchZGWj0BCNmNV5/FrS8pbBLF5MqnkhNpW94BFA5ILh7FEX1iX9QUkzo79s9Wkur
	 fJcbOndj1OL5aflbhuV97ZHblj5CCOG0CP+ppX3uRTYmcDLmlwSweZLzOagSku0mfg
	 6zL4kn76qhHdlCHjHmajIMQ8WZHY7ERskmTAUcZg=
Message-ID: <14defc31-66b6-4f00-bfa9-2457b8466f45@arm.com>
Date: Tue, 17 Nov 2026 15:42:38 +0530
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 00/12] improve mremap_test
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, "Liam R . Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, Kalesh Singh <kaleshsingh@google.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Park Tae-sun
 <ts930@dgu.ac.kr>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261102100211.141831-1-sarthak.sharma@arm.com>
 <avsmKAf4MRwGdpGI@gremlin>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <avsmKAf4MRwGdpGI@gremlin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/16/26 9:21 PM, Lorenzo Stoakes (ARM) wrote:
> Hi Sarthak,
> 
> Sorry we're being slow on this one, right now mm is really inundated with stuff
> so we're in firefighting mode (see [0]), so I'm not sure if we'll have time to
> get back to this this cycle, will try to if I'm able to! :)

Yup, makes sense. I'd missed the firefighting mode email, thanks for
pointing :)

> 
> --
> Cheers, Lorenzo
> 
> [0]: https://lore.kernel.org/linux-mm/a2f584f6-e382-4876-aa6d-d5a34de6ee59@kernel.org/

