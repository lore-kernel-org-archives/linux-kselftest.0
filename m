From: shuah@kernel.org (shuah)
Date: Wed, 2 Jan 2019 15:18:57 -0700
Subject: [PATCH 1/2] selftests: rtc: rtctest: fix alarm tests
In-Reply-To: <20181218213421.15447-1-alexandre.belloni@bootlin.com>
References: <20181218213421.15447-1-alexandre.belloni@bootlin.com>
Message-ID: <43bcf585-4b66-024a-0968-c96fe327a10b@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190102221857.kZ9r7UJZPWVlQnChCRvjx5038pmlz486E-X4J6iTvsw@z>

On 12/18/18 2:34 PM, Alexandre Belloni wrote:
> Return values for select are not checked properly and timeouts may not be
> detected.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni at bootlin.com>

Thanks. I will get these into the 4.21-rc2

-- Shuah
