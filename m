Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5E338E8CB;
	Wed, 13 May 2026 03:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778641593; cv=none; b=ug4sOskDkhsH48QBXpKnsFN/wRa290LHMFrs/l41cz08Sk4HWyZYjomyZAUeDAvP3NiqTfcyTx0zg+QRf4WocmFDHa8DBrApK6XGZ2PPoTmbVzrZmlzfb9hurRL02dgLoWJGL0ThRluJFCPxLbTX/vA4qKK8ZmqIRV7vDVJ/oog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778641593; c=relaxed/simple;
	bh=v42Q3fJGlh3sKqS7/VSV1G4hfJ35NzHyYQOEaT5rKHU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=iK1aiEXZzW0MjxfE2sf0gUDi1rYyCJocvFVym7xeZrx8y2WMKYmDaKZzTTO8Frc2U8JmE8TM+PIjdTOPUxuuolIT7qNW/qfLdXi20VVH3rMzcy8RO2d8FMlAKVy+NchqKyw8hGwW2U0RtFXX0+OmfTdh6qTNYWgAxmPBgB3ZG0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Ej+cBwUb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Ej+cBwUb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E4EAC2BCB0;
	Wed, 13 May 2026 03:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1778641592;
	bh=v42Q3fJGlh3sKqS7/VSV1G4hfJ35NzHyYQOEaT5rKHU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ej+cBwUbAXVsbiOMGcLXz75uvDj/ANS2LRzDcuaO/LFvYW66d/JVS3beplyN3fnaZ
	 JiLERm38ema69N8JJZrBLIYsrCopjXeEVlQYukw8NwxM879A7g7jEaxYIs9y4bLlkg
	 cs6wZqmBCrhOEqghLr5iGE1G1WmvGyaGMYby0zpg=
Date: Tue, 12 May 2026 20:06:31 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Aboorva Devarajan <aboorvad@linux.ibm.com>
Cc: Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, Sayali Patil <sayalip@linux.ibm.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] selftests/mm: assorted fixes for hmm-tests
Message-Id: <20260512200631.b52b15dd47cdbfb887ab3e3b@linux-foundation.org>
In-Reply-To: <cover.1777870179.git.aboorvad@linux.ibm.com>
References: <cover.1777870179.git.aboorvad@linux.ibm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  4 May 2026 14:41:05 +0530 Aboorva Devarajan <aboorvad@linux.ibm.com> wrote:

> This series fixes a few issues in hmm-tests that show up when
> page-size and huge-page configuration differ from the hardcoded
> assumptions the tests were written for (PMD/THP sizing, default
> hugepage size, and related cases).
> 
> It also includes a minor fix to exclusive_cow: the test ignored the
> return value of fork(), so both parent and child ran the same teardown
> path.

Thanks.  AI review asked a few reasonable-sounding questions:
	https://sashiko.dev/#/patchset/cover.1777870179.git.aboorvad@linux.ibm.com
