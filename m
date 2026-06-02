Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7FA3C3C1C;
	Tue,  2 Jun 2026 08:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780388023; cv=none; b=evATbd+IvRFN2ROaD6ZCkTRQMGzttMfKjJqogC5l6Yb6F5ijPK+B/92ecAFEEJHRNaJebapke+TZgXu7fQTgyY8HwctM4SlDIj0rFF50fz21tVKPlk4xXM4MMcSoTAHz6CQ+/7gyWtszxmQ0ichFQGC0sk1+UBGxcFZx3IO/6LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780388023; c=relaxed/simple;
	bh=ai5RgupvCcS37Dih3Cd0dYsObdLaYroWgKOhVltlr7E=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=W6tEirTUyJgWUpw6VRM0at0O+naZtAD9zj7gfvUi7JRjTlJTU5YBfnX4D5IWV4IYTOEqj4cnOcqlMsLXx6/dShhR+zYfT4C/5w8LtDvlUsA8RdIxxaa9HllZWhZoYgRdMhYB9b1trcO0N1Rw43p9EbpLK8cUSjoxOI488kx1ffI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bpa1KuA5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bpa1KuA5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B3AD1F00893;
	Tue,  2 Jun 2026 08:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780388022;
	bh=dBkjXMTmjLYTnOUwfnks3EFmZB9pPlPFfyMtmk7cI3U=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Bpa1KuA5WsCD66AasZ0sl3TPcc1/4v3KFLp4MBWQ3V/DKp9IxKexcZETomuPehqTH
	 oW7AjhG5pIG0+1zPLNhQr1BDSRpxy0OXJLhEu054Dk67FXWjHvCzfw+yOu7ZSXp9WJ
	 TTMEJZlPB80bvMNID92SiC2lb+b5+MbERApA9AM+sYZsv/xvWNdPNt0RFDlZv4BH8G
	 0lubNHY31s9XSrUDOq0nXy9XEegapfFje+0pK4oRel7PqRqFxQ640yWxWQRe5qEHCX
	 dElzNPk+Fbugx4/pfXDfPeoWC4gg0nTxxb7+/9VvEPJNz0qQnr4IzF0xJ68T7cSaa0
	 DoWuzoVX7NVSw==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 01/13] liveupdate: change file_set->count type to
 u64 for type safety
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, rppt@kernel.org, shuah@kernel.org, 
 akpm@linux-foundation.org, linux-mm@kvack.org, skhan@linuxfoundation.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, corbet@lwn.net, 
 dmatlack@google.com, kexec@lists.infradead.org, pratyush@kernel.org, 
 skhawaja@google.com, graf@amazon.com
In-Reply-To: <20260530221938.115978-2-pasha.tatashin@soleen.com>
References: <20260530221938.115978-1-pasha.tatashin@soleen.com>
 <20260530221938.115978-2-pasha.tatashin@soleen.com>
Date: Tue, 02 Jun 2026 11:13:34 +0300
Message-Id: <178038801483.119771.5551368813719436713.b4-review@b4>
X-Mailer: b4 0.15.2

On Sat, 30 May 2026 22:19:26 +0000, Pasha Tatashin <pasha.tatashin@soleen.com> wrote:
> This improves type safety and aligns the in-memory file_set->count with
> the serialized count type. It avoids potential truncation or sign
> conversion mismatch issues.

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

