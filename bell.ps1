
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName microsoft.VisualBasic

$title = "Ring 'Da Bell";

$form = New-Object System.Windows.Forms.Form;
$form.Text = $title;
$form.Size = New-Object System.Drawing.Size(500,300);
$form.StartPosition = 'CenterScreen';

$okButton = New-Object System.Windows.Forms.Button;
$okButton.Location = New-Object System.Drawing.Point(75,120);
$okButton.Size = New-Object System.Drawing.Size(75,40);
$okButton.Text = 'Ring It!';
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK;
$form.AcceptButton = $okButton;
$form.Controls.Add($okButton);

$stopButton = New-Object System.Windows.Forms.Button;
$stopButton.Location = New-Object System.Drawing.Point(250,120);
$stopButton.Size = New-Object System.Drawing.Size(200,40);
$stopButton.Text = 'Stop The Ringing';
$stopButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel;
$form.CancelButton = $stopButton;
$form.Controls.Add($stopButton);
    
$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(160,20)
$label.Size = New-Object System.Drawing.Size(280,35)
$label.Text = 'Bell Count'
$form.Controls.Add($label)

$textBox = New-Object System.Windows.Forms.TextBox;
$textBox.Location = New-Object System.Drawing.Point(160,55);
$textBox.AutoSize = $True;
#$textBox.Size = New-Object System.Drawing.Size(400,40);
$textBox.Font = New-Object System.Drawing.Font("Arial", 12);
$form.Controls.Add($textBox);

$bells = 1;
$wshell = New-Object -ComObject wscript.shell;
do {
    $textBox.Text = $bells.ToString('#');

    $form.TopMost = $true;
    $result = $form.ShowDialog();
    if($result -eq [System.Windows.Forms.DialogResult]::Cancel) {
        break;
    }
    $bells = [int64]$textBox.Text;

    $str = ':bell: x' + $bells.ToString('#') + "~";

    Start-Sleep -Milliseconds 750
    $wshell.AppActivate('Chat');
#    $wshell.SendKeys("$str");
    [System.Windows.Forms.SendKeys]::SendWait($str);

    $bells++;
    $wshell.AppActivate('Untitled - Notepad');
} while (1)
