From: sean@mess.org (Sean Young)
Date: Thu, 1 Nov 2018 15:07:17 +0000
Subject: [PATCH] media: rc: self test for IR encoders and decoders
In-Reply-To: <cc852823-687a-4cbf-288b-99030462ce21@kernel.org>
References: <20181016140931.21097-1-sean@mess.org>
 <cc852823-687a-4cbf-288b-99030462ce21@kernel.org>
Message-ID: <20181101150717.5nriiopjujhqpaj3@gofer.mess.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181101150717.1SH-QpNT4btxAN12fvzS_qmo2O6IfAWsTT0PdOn4uT8@z>

Hi Shuah,

On Thu, Nov 01, 2018@08:59:39AM -0600, Shuah Khan wrote:
> On 10/16/2018 08:09 AM, Sean Young wrote:
> > ir-loopback can transmit IR on one rc device and check the correct
> > scancode and protocol is decoded on a different rc device. This can be
> > used to check IR transmission between two rc devices. Using rc-loopback,
> > we use it to check the IR encoders and decoders themselves.
> > 
> > No hardware is required for this test.
> > 
> > Signed-off-by: Sean Young <sean at mess.org>
> > Cc: Shuah Khan <shuah at kernel.org>
> 
> Hi Sean,
> 
> This looks good. I will get this into the next release. It will show
> up in linux-kselftest next after 4.20-rc1 comes out.

Great, thank you very much.

Regards,

Sean
