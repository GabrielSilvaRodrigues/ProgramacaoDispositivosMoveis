package com.example.myfirstapp

import android.inputmethodservice.ExtractEditText
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {
    private lateinit var editTextPeso: EditText
    private lateinit var editTextAltura: EditText
    private lateinit var buttonIniciar: Button
    private lateinit var textViewResultado: TextView
    override fun onCreate(savedInstanceState: Bundle?) {

        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main)

        editTextPeso=findViewById(R.id.editTextText)
        editTextAltura=findViewById(R.id.editTextText2)
        buttonIniciar=findViewById(R.id.button)
        textViewResultado=findViewById(R.id.textView2)

        buttonIniciar.setOnClickListener {
            val Peso = editTextPeso.text.toString().toDouble()
            val Altura = editTextAltura.text.toString().toDouble()
            val Imc = Peso / (Altura * Altura)
            textViewResultado.text = "Seu IMC é $Imc"
        }
    }
}